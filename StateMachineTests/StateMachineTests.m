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

- (void)testNavigation
{
    stateMachine = [stateMachine initWithMapping:mapping andInitialState:@"A"];
    BOOL result = [stateMachine canMoveToState:@"B"];
    XCTAssertTrue(result, @"Should be possible to go to state B, but it faled");
    
    result = [stateMachine moveToState:@"B"];
    XCTAssertTrue(result, @"Failed to move to state B");
    XCTAssertEqualObjects(@"B", stateMachine.presentState, @"Expected State: B - Found State: %@", stateMachine.presentState);
    
    result = [stateMachine canMoveToState:@"C"];
    XCTAssertFalse(result, @"Transition to state C should not be allowed");
    
    result = [stateMachine moveToState:@"C"];
    XCTAssertEqualObjects(@"B", stateMachine.presentState, @"Expected State: B - Found State: %@", stateMachine.presentState);
    XCTAssertFalse(result, @"Wrong value returned");
    
    result = [stateMachine moveToState:@"F"];
    XCTAssertEqualObjects(@"F", stateMachine.presentState, @"Expected State: F - Found State: %@", stateMachine.presentState);
    XCTAssertTrue(result, @"Wrong value returned");
}

@end
