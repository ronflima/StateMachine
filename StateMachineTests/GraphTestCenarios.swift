//
//  GraphTestCenarios.swift
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 13/04/17.
//  Copyright © 2017 Ronaldo Faria Lima. All rights reserved.
//

import XCTest
@testable import StateMachine

class GraphTestCenarios: XCTestCase {
    let vertexes = ["A", "B", "C", "D", "E", "F"]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBasicScenario() {
        var graph = Graph()
        for vertex in vertexes {
            graph.addVertex(vertex: vertex)
        }
        // Build the following graph:
        // A -> B -> C
        // |
        // V
        // D -> E -> F
        graph.addEdge(from: "A", to: "B")
        graph.addEdge(from: "A", to: "D")
        graph.addEdge(from: "B", to: "C")
        graph.addEdge(from: "D", to: "E")
        graph.addEdge(from: "E", to: "F")
        let aEdges = graph.edges(for: "A")
        XCTAssertNotNil(aEdges)
        XCTAssert(aEdges?.count == 2, "Wrong number of edges")
        for edge in aEdges! {
            XCTAssert(edge == "B" || edge == "D")
        }
    }
    
    func testSubscripts() {
        var graph = Graph()
        for vertex in vertexes {
            graph.addVertex(vertex: vertex)
        }
        // Build the following graph using subscripts:
        // A -> B -> C
        // |
        // V
        // D -> E -> F
        graph["A"] = Edges(arrayLiteral: "B", "D")
        graph["B"] = Edges(arrayLiteral: "C")
        graph["C"] = Edges()
        graph["D"] = Edges(arrayLiteral: "E")
        graph["E"] = Edges(arrayLiteral: "F")
        graph["F"] = Edges()
        // Check data to verify number of edges on each vertex
        let checkData = ["A": 2, "B": 1, "C": 0, "D": 1, "E": 1, "F": 0]
        for vertex in graph.vertexes {
            XCTAssertNotNil(graph[vertex])
            if vertex != "C" && vertex != "F" {
                XCTAssert(graph[vertex]!.count > 0)
            }
            XCTAssertEqual(graph[vertex]!.count, checkData[vertex])
        }
    }
    
    func testSubscriptsWithoutCreatingVertexes() {
        var graph = Graph()
        // Build the following graph using subscripts:
        // A -> B -> C
        // |
        // V
        // D -> E -> F
        graph["A"] = Edges(arrayLiteral: "B", "D")
        graph["B"] = Edges(arrayLiteral: "C")
        graph["C"] = Edges()
        graph["D"] = Edges(arrayLiteral: "E")
        graph["E"] = Edges(arrayLiteral: "F")
        graph["F"] = Edges()
        // Check data to verify number of edges on each vertex
        let checkData = ["A": 2, "B": 1, "C": 0, "D": 1, "E": 1, "F": 0]
        for vertex in graph.vertexes {
            XCTAssertNotNil(graph[vertex])
            if vertex != "C" && vertex != "F" {
                XCTAssert(graph[vertex]!.count > 0)
            }
            XCTAssertEqual(graph[vertex]!.count, checkData[vertex])
        }
    }
}
