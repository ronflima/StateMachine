//
//  StateMachine.h
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 20/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

//! \class StateMachine
//! \brief State machine is a simple implementation of a state machine. It manages
//! proper state changing, calling a delegate for every single state transition in order to
//! let the state change to trigger appropriate responses.
@interface StateMachine : NSObject

//! \brief Adds a new state to the state machine's state table.
- (void)addState:(NSString *)state;

//! \brief Adds a transition from a given state to another state.
//! \param origin Origin state
//! \param destiny Destination state
- (void)addTransitionFromState:(NSString *)origin toState:(NSString *)destiny;

//! \brief Adds a full state mapping to the state machine. State machine will follow the provided
//! map.
//! \param stateMap Dictionary containing the state map
//! \remarks The state map functions like a adjacency list, with each key as a state and the contents put as an array
//! of items.
- (void)addStateMapping:(NSDictionary *)stateMap;

@end
