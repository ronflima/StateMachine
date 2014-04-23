//
//  GraphTests.m
//  GraphTests
//
//  Created by Ronaldo Faria Lima on 20/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Graph.h"

@interface GraphTests : XCTestCase

@end

@implementation GraphTests
{
    NSArray *vertexes;
    NSDictionary *mapping;
    Graph *graph;
}

- (void)setUp
{
    [super setUp];
    vertexes = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G"];
    mapping = @{@"A":@[@"B", @"C"], @"B":@[@"F"], @"C":@[@"D"], @"D":@[@"E"], @"E":@[@"F"], @"F":@[@"G"]};
    // Mapping builds the following graph:
    // A -> B -> F -> G
    // |         ^
    // V         |
    // C -> D -> E
    graph = [[Graph alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Test graph initialization by using a graph mapping
- (void)testGraphInitialization
{
    Graph *aGraph = [[Graph alloc] initWithMapping:mapping];
    XCTAssertEqual(aGraph.allVertexes.count, 7, @"Wrong number of vertexes");
}

// Test vertex addition method
- (void)testVertexAdd
{
    [vertexes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [graph addVertex:obj];
    }];
    XCTAssertEqual(graph.allVertexes.count, 7, @"Wrong number of vertexes. Found %d", graph.allVertexes.count);
}

// Test edge addition
- (void)testEdgeAddition
{
    for (NSString *vertex in mapping) {
        NSArray *edges = mapping[vertex];
        [edges enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [graph addEdgeFromVertex:vertex toVertex:obj];
        }];
    }
    XCTAssertEqual(graph.allVertexes.count, 7, @"Wrong number of vertexes. Found %d", graph.allVertexes.count);
}


@end
