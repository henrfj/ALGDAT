"""
Question 1-2: Broadest path from one to all
A broadest path is a path where the "smallest" edge is as big as possible. 
Example in pratical use: a military convoy needs path where there is always mots possible room available
In these exercises: internet routing and bandwith. The bottleneck router should be as big as possible (more MB/s = bigger)

w = 

"""

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

