//
//  StateMachineDelegate.swift
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 18/04/17.
//  Copyright © 2017 Ronaldo Faria Lima. All rights reserved.
//

import Foundation

/// State machine delegate protocol. Gives the opportunity to respond to state transitions
///
/// - Remarks:
/// Methods willTransition and didTransition are called only if the state transition is allowed. If not allowed,
/// for instance, when the graph does not permit it, both are not called. Instead, the failedToTransaction will
/// be called. Since the delegate will receive the origin/destination states as parameters, it can take action 
/// when such a failure arrive.
@objc
public protocol StateMachineDelegate {
    
    /// Called just before transition from one state to another
    ///
    /// - Parameters:
    ///   - from: Original state
    ///   - to: State that the machine will be transitioned to
    @objc optional func willTransition(from: String, to: String)
    
    /// Called just after a successful state transition
    ///
    /// - Parameters:
    ///   - from: Original state
    ///   - to: State that the machine transitioned to
    @objc optional func didTransition(from: String, to: String)
    
    /// Error handling. Called when a state transitioning resulted in an error.
    ///
    /// - Parameters:
    ///   - from: Original state
    ///   - to: State that the machine tried to transition to
    @objc optional func failedToTransition(from: String, to: String)
}
