//
//  Graph.m
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 21/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import "Graph.h"

@interface Graph ()

@property (strong, nonatomic) NSMutableDictionary *adjacencyList;

@end

@implementation Graph

#pragma mark - Initializers

- (instancetype)initWithMapping:(NSDictionary *)mapping
{
    if ((self = [super init])) {
        // Traverses the mapping, creating the adjacency list
        for (NSString *origin in mapping) {
            NSArray *destinations = mapping[origin];
            for (NSString *destination in destinations) {
                [self addEdgeFromVertex:origin toVertex:destination];
            }
        }
    }
    return self;
}

#pragma mark - Public Methods

- (void)addVertex:(NSString *)vertex
{
    if (! [self.adjacencyList.allKeys containsObject:vertex]) {
        [self.adjacencyList setValue:[NSNull null] forKey:vertex];
    }
}

- (void)addEdgeFromVertex:(NSString *)origin toVertex:(NSString *)destination
{
    [self addVertex:origin];
    [self addVertex:destination];
    NSMutableSet *edges = [self.adjacencyList valueForKey:origin];
    if ([edges isEqual:[NSNull null]]) {
        edges = [NSMutableSet set];
    }
    if (! [edges containsObject:destination]) {
        [edges addObject:destination];
    }
}

#pragma mark - Getters and Setters

- (NSMutableDictionary *)adjacencyList
{
    if (!_adjacencyList) {
        _adjacencyList = [NSMutableDictionary dictionary];
    }
    return _adjacencyList;
}

- (NSArray *)allVertexes
{
    return self.adjacencyList.allKeys;
}

@end
