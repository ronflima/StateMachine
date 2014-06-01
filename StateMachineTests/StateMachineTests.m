//
//  StateMachineTests.m
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 01/06/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StateMachine.h"

@interface StateMachineTests : XCTestCase

@end

@implementation StateMachineTests
{
    NSDictionary *mapping;
    StateMachine *stateMachine;
}

- (void)setUp
{
    [super setUp];
    mapping = @{@"A":@[@"B", @"C"], @"B":@[@"F"], @"C":@[@"D"], @"D":@[@"E"], @"E":@[@"F"], @"F":@[@"G"]};
    // Mapping builds the following graph (same if GraphTests):
    // A -> B -> F -> G
    // |         ^
    // V         |
    // C -> D -> E
    stateMachine = [[StateMachine alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitialization
{
    stateMachine = [stateMachine initWithMapping:mapping andInitialState:@"A"];
    XCTAssertEqualObjects(stateMachine.presentState, @"A", @"Wrong initial state. Expected: A - Found: %@", stateMachine.presentState);
}

@end
