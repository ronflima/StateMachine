//
//  Graph.swift
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 13/04/17.
//  Copyright © 2017 Ronaldo Faria Lima. All rights reserved.
//

import Foundation

typealias Edges = Set<String>

/// Directed graph implementation.
/// - remarks: This is not intended to be a full implementation of such algorithm. It is small enough to fit the needs
/// of this small framework. So, not all situations are implemented in this struct.
struct Graph {
    /// Returns a list of vertexes
    var vertexes: [String] {
        return adjacencyList.keys.map { $0 }
    }
    
    /// Adjacency list.
    /// - remarks: A graph is represented by an origin as a dictionary key and its possible destinations as a set of 
    /// elements. Every destination must be a key in this table.
    fileprivate var adjacencyList: [String:Edges] = [:]
    
    init() {}
 
    /// Adds a vertex to the adjacency list
    ///
    /// - Parameter vertex: Vertex to add
    mutating func addVertex(vertex: String) {
        if !adjacencyList.keys.contains(vertex) {
            adjacencyList[vertex] = Edges()
        }
    }
    
    /// Adds an edge between two vertexes
    ///
    /// - Parameters:
    ///   - from: Origin vertex
    ///   - to: Destination vertex
    mutating func addEdge(from: String, to: String) {
        // Adds both vertexes to adjacency list if they are not already present
        addVertex(vertex: from)
        addVertex(vertex: to)
        // It is unecessary to check for nil here. addVertex method guarantees the vertex has edges,
        // even an empty list of them.
        var edges: Edges! = adjacencyList[from]
        edges.insert(to)
        adjacencyList[from] = edges
    }
    
    /// Gets the list of edges for a given vertex
    ///
    /// - Parameter vertex: Vertex to get the list of edges
    /// - Returns: A list of edges or nil if the vertex does not exist in the adjacency list
    /// - Remarks: If a vertex do exist inside the adjacency list, this will return a set of edges, even if there is no
    /// edge for the given vertex.
    func edges(for vertex: String) -> Edges? {
        return adjacencyList[vertex]
    }
    
    /// Gives the subscript syntax to a graph, letting easy manipulation over edges
    ///
    /// - Parameter vertex: vertex to work in
    /// - Returns: A possible list of edges
    subscript(vertex: String) -> Edges? {
        get {
            return edges(for: vertex)
        }
        set (newSetOfEdges) {
            if let newSetOfEdges = newSetOfEdges {
                for edge in newSetOfEdges {
                    addEdge(from: vertex, to: edge)
                }
            }
        }
    }
}
