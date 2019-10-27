
using DataStructures: Queue, enqueue!, dequeue!

l = []

append!(l, [(4, 3)])
append!(l, [(4, 3)])
append!(l, [(4, 3)])
append!(l, [(4, 3)])
append!(l, [(4, 3)])

println("Tuple-list: ", l)



q = Queue{Int}()
for i in 1:15
    enqueue!(q, i)
end

while length(q) > 0
    dequeue!(q)
end

# println("q Is empty")

maze = [0 0 0 0 0
        0 1 1 1 0
        0 1 0 0 0
        0 1 1 1 0
        0 0 0 0 0]

nodearray = Array{Int}(undef, size(maze, 1), size(maze, 2))
nodearray[2, 2] = 1
# println(nodearray)

arr = [1, 2, 3]
append!(arr, 10)
#println(arr)

mutable struct Node
    # Coordinates to indentify the node
    i::Int
    j::Int
    # Tells if the node is floor or wall
    floor::Bool
    # All nodes with edge to this node
    neighbors::Array{Node}
    # A unidentified node is white, then grey when it is discovered and black after being expanded.
    color::Union{String,Nothing}
    # From startnode to this node
    distance::Union{Int,Nothing}
    # Yes. Note that Union{type1, type2} means the var can be type1 or type2.
    predecessor::Union{Node,Nothing}
end
# A constructor for easy access. 
Node(i, j, floor=true) = Node(i, j, floor, [], nothing, nothing, nothing)


# HOW TO ADD TO THE SHIT

n1 = Node(1, 2, false)
n2 = Node(3, 5)
n3 = Node(10, 11)


resize!(n1.neighbors, length(n1.neighbors) + 1)
n1.neighbors[length(n1.neighbors)] = n2
resize!(n1.neighbors, length(n1.neighbors) + 1)
n1.neighbors[length(n1.neighbors)] = n3
println(n1.neighbors)

my_arr = Array{Int}(undef, 2 * 3)
#println(my_arr)
