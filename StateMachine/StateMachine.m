//
//  StateMachine.m
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 20/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import "StateMachine.h"
#import "Graph.h"

//! \internal
//! \category StateMachine
//! \brief Class Extension to hold private declarations
@interface StateMachine ()

//! \internal
//! \property graph
//! \brief Internal graph used for state control
@property (strong, nonatomic) Graph *graph;

@end

@implementation StateMachine
{
    NSInteger _presentState;
    NSInteger _initialState;
}

- (instancetype)initWithMapping:(NSDictionary *)mapping andInitialState:(NSString *)initialState
{
    if ((self = [super init])) {
        [self addStateMapping:mapping];
        [self setInitialState:initialState];
    }
    return self;
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

- (void)reset
{
    _presentState = _initialState;
    if (self.delegate && [self.delegate respondsToSelector:@selector(stateMachineDidReset)]) {
        [self.delegate stateMachineDidReset];
    }
}

#define STATE_IN_GRAPH(state) [self.graph.allVertexes containsObject:state]

- (BOOL)setInitialState:(NSString *)state
{
    if (STATE_IN_GRAPH(state)) {
        _presentState = _initialState = [self.graph.allVertexes indexOfObject:state];
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
            NSString *currentState = self.presentState;
            if (self.delegate && [self.delegate respondsToSelector:@selector(stateMachine:willMoveFromState:toState:)]) {
                [self.delegate stateMachine:self willMoveFromState:currentState toState:newState];
            }
            _presentState = [self.graph.allVertexes indexOfObject:newState];
            if (self.delegate && [self.delegate respondsToSelector:@selector(stateMachine:didMoveFromState:toState:)]) {
                [self.delegate stateMachine:self didMoveFromState:currentState toState:newState];
            }
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
