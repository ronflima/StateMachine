//
//  StateMachineDelegate.h
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 01/06/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StateMachine;

@protocol StateMachineDelegate <NSObject>

@optional

- (void)stateMachine:(StateMachine *)stateMachine willMoveFromState:(NSString *)origin toState:(NSString *)destination;

- (void)stateMachine:(StateMachine *)stateMachine didMoveFromState:(NSString *)origin toState:(NSString *)destination;

- (void)stateMachineDidReset;

@end
