//
//  StateMachine.swift
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 17/04/17.
//  Copyright © 2017 Ronaldo Faria Lima. All rights reserved.
//

import Foundation

public enum StateMachineError: Error {
    case invalidState
    case invalidStateTransition
}

public struct StateMachine {
    /// State graph. Contains all possible states and transitions
    fileprivate var stateGraph = Graph()
    
    /// Initial state of this state machine
    fileprivate let initialState: String
    
    /// Storage for the current state
    fileprivate var _currState: String
    
    /// Current state. Read-only.
    public var currentState: String {
        get {
            return _currState
        }
    }
    
    /// Initializes the state machine, putting it on the initial state
    ///
    /// - Parameter initialState: Initial state
    public init(initialState: String) {
        self.initialState = initialState
        self._currState = initialState
        stateGraph.addVertex(vertex: initialState)
    }
    
    /// Forces a state transition by changing the current state according to possible transitions.
    ///
    /// - Parameter newState: New state to transition to
    /// - Throws: StateMachineError.invalidState if provided state is not already set
    /// - Throws: StateMachineError.invalidStateTransition if there is no configured transition from old state to the
    /// new one.
    public mutating func setCurrentState(to newState: String) throws {
        if !stateGraph.vertexes.contains(newState) {
            throw StateMachineError.invalidState
        }
        if let edges = stateGraph.edges(for: currentState) {
            if !edges.contains(newState) {
                throw StateMachineError.invalidStateTransition
            }
        } else {
            throw StateMachineError.invalidStateTransition
        }
        _currState = newState
    }
    
    /// Adds a state transition from a state to another.
    ///
    /// - Parameters:
    ///   - from: State that will accept the transition
    ///   - to: State to which transition will occurr
    public mutating func addTransition(from: String, to: String) {
        stateGraph.addEdge(from: from, to: to)
    }
}
