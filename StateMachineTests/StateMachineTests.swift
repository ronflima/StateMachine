//
//  StateMachineTests.swift
//  StateMachineTests
//
//  Created by Ronaldo Faria Lima on 13/04/17.
//  Copyright © 2017 Ronaldo Faria Lima. All rights reserved.
//

import XCTest
@testable import StateMachine

class FullDelegate: StateMachineDelegate {
    func willTransition(from: String, to: String) {
        if from == "A" && to != "B" {
            XCTFail()
        } else if from == "B" && to != "C" {
            XCTFail()
        }
    }
    
    func didTransition(from: String, to: String) {
        if from == "A" && to != "B" {
            XCTFail()
        } else if from == "B" && to != "C" {
            XCTFail()
        }
    }
    
    func failedToTransition(from: String, to: String) {
        if from == "C" && to != "D" {
            XCTFail()
        }
    }
}

class StateMachineTests: XCTestCase {
    var sm: StateMachine!
    override func setUp() {
        super.setUp()
        sm = StateMachine(initialState: "A")
        // Build the following graph:
        // A -> B -> C
        // |
        // V
        // D -> E -> F
        sm.addTransition(from: "A", to: "B")
        sm.addTransition(from: "A", to: "D")
        sm.addTransition(from: "B", to: "C")
        sm.addTransition(from: "D", to: "E")
        sm.addTransition(from: "E", to: "F")
    }
    
    override func tearDown() {
        super.tearDown()
        sm = nil
    }
    
    /// Tests the state machine basic setup
    func testBasicScenario() {
        do {
            // Those must work
            try sm.setCurrentState(to: "B")
            try sm.setCurrentState(to: "C")
        } catch {
            XCTFail()
        }
        do {
            try sm.setCurrentState(to: "B")
            XCTFail()
        } catch {
            // Must throw an exception
        }
    }
    
    func testRewinds() {
        do {
            // Those must work
            try sm.setCurrentState(to: "B")
            try sm.setCurrentState(to: "C")
        } catch {
            XCTFail()
        }
        sm.rewind()
        do {
            // Must work.
            try sm.setCurrentState(to: "B")
        } catch {
            XCTFail()
        }
    }
    
    func testFullDelegate() {
        let fullDelegate = FullDelegate()
        sm.delegate = fullDelegate
        do {
            // Those must work
            try sm.setCurrentState(to: "B")
            try sm.setCurrentState(to: "C")
        } catch {
            XCTFail()
        }
        do {
            // Must fail.
            try sm.setCurrentState(to: "D")
            XCTFail()
        } catch {
            // Do nothing.
        }
    }
}
