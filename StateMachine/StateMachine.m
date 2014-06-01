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
{
    NSInteger _presentState;
}

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

#define STATE_IN_GRAPH(state) [self.graph.allVertexes containsObject:state]

- (BOOL)setInitialState:(NSString *)state
{
    if (STATE_IN_GRAPH(state)) {
        _presentState = [self.graph.allVertexes indexOfObject:state];
        return YES;
    }
    return NO;
}

- (BOOL)canMoveToState:(NSString *)newState
{
    if (STATE_IN_GRAPH(newState)) {
        NSString *currState = [self.graph.allVertexes objectAtIndex:_presentState];
        NSSet *edges = [self.graph edgesForVertex:currState];
        return [edges containsObject:newState];
    }
    return NO;
}

- (BOOL)moveToState:(NSString *)newState
{
    if (STATE_IN_GRAPH(newState)) {
        if ([self canMoveToState:newState]) {
            _presentState = [self.graph.allVertexes indexOfObject:newState];
            return YES;
        }
    }
    return NO;
}

#pragma mark - Getters and Setters

- (Graph *)graph
{
    if (! _graph) {
        _graph = [[Graph alloc] init];
    }
    return _graph;
}

- (NSString *)presentState
{
    return [self.graph.allVertexes objectAtIndex:_presentState];
}

@end
