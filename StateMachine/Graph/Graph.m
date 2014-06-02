//
//  Graph.m
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 21/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import "Graph.h"

//! \internal
@interface Graph ()

@property (strong, nonatomic) NSMutableDictionary *adjacencyList;

@end

@implementation Graph

#pragma mark - Initializers

- (instancetype)initWithMapping:(NSDictionary *)mapping
{
    if ((self = [super init])) {
        [self addMapping:mapping];
    }
    return self;
}

#pragma mark - Public Methods

- (void)addMapping:(NSDictionary *)mapping
{
    // Traverses the mapping, creating the adjacency list
    for (NSString *origin in mapping) {
        NSArray *destinations = mapping[origin];
        for (NSString *destination in destinations) {
            [self addEdgeFromVertex:origin toVertex:destination];
        }
    }
}

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
    [self.adjacencyList setValue:edges forKey:origin];
}

- (NSSet *)edgesForVertex:(NSString *)vertex
{
    if ([self.allVertexes containsObject:vertex]) {
        // It is a oriented graph. So, we get only the edges flowing out of the vertex
        // Edges coming to the vertex are ignored and makes sense only in non-oriented graphs,
        // which is not the case.
        NSSet *edges = [self.adjacencyList valueForKey:vertex];
        return edges;
    }
    return nil;
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
