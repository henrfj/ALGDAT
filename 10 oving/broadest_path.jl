"""
Question 1-2: Broadest path from one to all
A broadest path is a path where the "smallest" edge is as big as possible. 
Example in pratical use: a military convoy needs path where there is always mots possible room available
In these exercises: internet routing and bandwith. The bottleneck router should be as big as possible (more MB/s = bigger)

w[(u,v)] returns weight of edge between the two nodes u and v

"""

using DataStructures: PriorityQueue, enqueue!, dequeue!


mutable struct Node
    name::String # used to distinguish nodes when debugging
    d::Union{Float64, Nothing} # d for distance
    p::Union{Node, Nothing} # p for predecessor
end
Node(name) = Node(name, nothing, nothing) # constructor used for naming nodes

mutable struct Graph
    """
    Non-directional graph
    """
    V::Array{Node} # V for Vertices
    Adj::Dict{Node, Array{Node}} # Adj for Adjacency
end

function general_dijkstra!(G, w, s, reverse=false)
    """
    Uses update! (RELAX) and initialize! to find shortes path to all nodes in G.

    param G: is the graph struct
    param w: is hash-table of edge-weights - w[(u, v)]
    param s: is the first element in G.V, and has name="A"
    param reverse:
    return: nothing; its an in-place algorithm
    """
    initialize!(G, s)

    if reverse
        Q = PriorityQueue(Base.Order.Reverse, u => u.d for u in G.V)
    else
        Q = PriorityQueue(u => u.d for u in G.V)
    end

    while !isempty(Q)
        u = dequeue!(Q)
        for v in G.Adj[u]
            update!(u, v, w)
            if haskey(Q, v)
                Q[v] = v.d
            end
        end
    end
end


## These are the given algorithms ##
"""
function initialize!(G, s)
    for v in G.V
        v.d = Inf
        v.p = nothing       
    end
    s.d = 0
end

function update(u, v, w)
    ## RELAX FUNCTION ##
    if v.d > u.d + w[(u, v)]
        v.d = u.d + w[(u, v)]
        v.p = u
    end
end
"""

### NOW we shall find the broadest path, using general_dijkstra 
### Må sette reverse=True, for å gå etter lavest prioritering, 
### (altså vi tar først ut de med høyest båndbredde)
### I tillegg må vi gjøre endringer på update! og initialize!

function initialize!(G, s)
    for v in G.V
        v.d = - typemax(Float64)
        v.p = nothing       
    end
    s.d = typemax(Float64)
end


function update!(u, v, w)
    ### Vanligvis:  v.d = min(v.d, u.d + w(u,v)) 
    ### Nå:         v.d = max(v.d, min(u.d, w(u,v)))
    ### --> Altså: node.d er størrelsen på den laveste båndbredden langs hele stien. 
    if v.d < min(u.d, w[(u, v)])
        v.d = min(u.d, w[(u, v)])
        v.p = u
    end
end