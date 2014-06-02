//
//  StateMachineTestDelegate.m
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 01/06/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import "StateMachineTestDelegate.h"

@implementation StateMachineTestDelegate

- (void)stateMachine:(StateMachine *)stateMachine didMoveFromState:(NSString *)origin toState:(NSString *)destination
{
    NSLog (@"[TEST DELEGATE] Moved from %@ to %@", origin, destination);
}

- (void)stateMachine:(StateMachine *)stateMachine willMoveFromState:(NSString *)origin toState:(NSString *)destination
{
    NSLog (@"[TEST DELEGATE] Will move from %@ to %@", origin, destination);
}

@end
