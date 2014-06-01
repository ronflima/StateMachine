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
@interface Graph : NSObject

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

@end
