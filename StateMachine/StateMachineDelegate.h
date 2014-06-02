//
//  StateMachineDelegate.h
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 01/06/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StateMachine;

//! \protocol StateMachineDelegate
//! \brief Delegate for state machine
@protocol StateMachineDelegate <NSObject>

@optional

//! \brief This method is called when state machine is about to move to a given state.
//! \param stateMachine State Machine instance
//! \param origin Origin state
//! \param destination Destionation state
- (void)stateMachine:(StateMachine *)stateMachine willMoveFromState:(NSString *)origin toState:(NSString *)destination;

//! \brief This method is called when state machine just moved to a new state.
//! \param stateMachine State Machine instance
//! \param origin Origin state
//! \param destination Destionation state
- (void)stateMachine:(StateMachine *)stateMachine didMoveFromState:(NSString *)origin toState:(NSString *)destination;

//! \brief This method is called when state machine reset to its initial state
- (void)stateMachineDidReset;

@end
