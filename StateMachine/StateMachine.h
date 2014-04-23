//
//  StateMachine.h
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 20/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateMachine : NSObject

- (void)addState:(NSString *)state;
- (void)addTransitionFromState:(NSString *)origin toState:(NSString *)destiny;
- (void)addStateMapping:(NSDictionary *)stateMap;

@end
