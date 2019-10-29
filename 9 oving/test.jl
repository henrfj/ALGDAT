x = 10
y = 3



mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    # Denne konstruktøren tilsvarer Make_set() fra boka
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

vec = Vector{DisjointSetNode}()
# println(vec)

node1 = DisjointSetNode()
append!(vec, [node1])
node2 = DisjointSetNode()
append!(vec, [node2])
node3 = DisjointSetNode()
append!(vec, [node3])

# println(vec)

# Works like 2d list in python
E = [(1, 2, 3), (4, 5, 6), (7, 8, 9), (10, 11, 12)]
println(E[1][3])
println(E[3][1:3])