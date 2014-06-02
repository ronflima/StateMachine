//
//  Graph.h
//  StateMachine
//
//  Created by Ronaldo Faria Lima on 21/04/14.
//  Copyright (c) 2014 Ronaldo Faria Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

//! \internal
//! \class Graph
//! \brief Simple implementation of an oriented graph algorithm
//! \remarks This is not a full implementation of a graph algorithm. This class contains only
//! the necessary information and methods to feed the state machine about possible state transitions.
//! The aim of this implementation is to be as simple as possible, without any extra functionality that is not
//! really necessary.
@interface Graph : NSObject

//! \property allVertexes
//! \brief A list of all configured vertexes
@property (strong, nonatomic, readonly) NSArray *allVertexes;

//! \brief Initializes the graph using a map of vertexes and edges
//! \param mapping Dictionary containing the map of vertexes and edges
//! \return An initialized instance of Graph class, if successful
//! \return nil on error
- (instancetype)initWithMapping:(NSDictionary *)mapping;

//! \brief Adds internal mapping of states and transitions
//! \param mapping Mapping to set the graph to 
- (void)addMapping:(NSDictionary *)mapping;

//! \brief Add a vertex to the graph setup
//! \param vertex Vertex to add
//! \remarks If the vertex is already added, ignore it.
- (void)addVertex:(NSString *)vertex;

//! \brief Add an edge for a pair of vertexes.
//! \param origin The origin vertex
//! \param destination The destination vertex
//! \remarks If one or both vertexes do not exist in current graph setup, add them.
//! If they are already there, simply add the edge
- (void)addEdgeFromVertex:(NSString *)origin toVertex:(NSString *)destination;

//! \brief Getter. Returns a list of edges for a given vertex
//! \param vertex Vertex to get edges from
//! \return NSSet if successful
//! \return nil if there are no edges for this vertex
- (NSSet *)edgesForVertex:(NSString *)vertex;

@end
