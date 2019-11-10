"""
PART 2:
Broadest path from all to all. We will also look at Schulzes method for choosing based on votes.
"""


### Task 1: Floy-Warshall general implementation

function floyd_warshall(adjacency_matrix, nodes, f, g)
    """ 
    Methods used in the algorithm. Normally we update a node like this:  
    dij = min(dij,dik+dkj), but we use dij = f(dij, g(dik,dkj)) instead.

    param: adjacency_matrix - a matrix of neighbour-relations i->j. 
            =>  wij = 0             if i = j
                wij = some weight   if i != j and there is such an edge
                wij = Inf           if i != j and there is no such edge
    param: nodes - number of nodes
    param: f/g => operators min()/+

    return: Matrix D, nxn matrix of all shortest distances.
    """     
    D = adjacency_matrix
    for k = 1:nodes
        for i = 1:nodes
            for j = 1:nodes
                D[i, j] = f(D[i, j], g(D[i, k], D[k, j]))
            end
        end
    end
    return D
end



### Task 2: Transitive-Closure

### Just useing last task, and reformat to correct matrix T. All weights below Inf will be set to 1 (as there exists any path)
### while all weight == 0 will also be set to 1, as there is a path to self. Inf distances means no path exists => 0.

function transitive_closure(adjacency_matrix, nodes)
    """
    Make a transitive_closure using the general floyd_warshall from last task.
    In floyd_warshall we used dij = min(dij, dik + dkj) where f = min() and g = sum()
    Now we only need to find if there exists a path at all: f = or, and g = and

    param: adjacency_matrix - a matrix of neighbour-relations i->j. 
            =>  wij = 0             if i = j
                wij = some weight   if i != j and there is such an edge
                wij = Inf           if i != j and there is no such edge
    param: nodes - number of nodes
    return: matrix T, showing if there is a possible transitive_closure from i->j
    """
    D = floyd_warshall(adjacency_matrix, nodes, min, +)
    for row in 1:nodes
        for col in 1:nodes
            if D[row, col] == 0
                D[row, col] = 1

            elseif D[row, col] < Inf
                D[row, col] = 1

            else
                D[row, col] = 0
            end
        end
    end
    return D
end


### TASK 3: Shulze ranking