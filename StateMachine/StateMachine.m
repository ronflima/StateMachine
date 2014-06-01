//
//  StateMachine.m
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 20/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import "StateMachine.h"
#import "Graph.h"

@interface StateMachine ()

//! \internal
//! \property graph
//! \brief Internal graph used for state control
@property (strong, nonatomic) Graph *graph;

@end

@implementation StateMachine

#pragma mark - Public Methods

- (void)addState:(NSString *)state
{
    [self.graph addVertex:state];
}

- (void)addTransitionFromState:(NSString *)origin toState:(NSString *)destiny
{
    [self.graph addEdgeFromVertex:origin toVertex:destiny];
}

- (void)addStateMapping:(NSDictionary *)stateMap
{
    [self.graph addMapping:stateMap];
}

#pragma mark - Getters and Setters

- (Graph *)graph
{
    if (! _graph) {
        _graph = [[Graph alloc] init];
    }
    return _graph;
}

@end
