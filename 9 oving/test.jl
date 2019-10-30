x = 10
y = 3


E = Vector{Tuple}()
push!(E, (1, 2, 3))
push!(E, (1, 2, 3))
push!(E, (1, 2, 3))
push!(E, (1, 2, 3))
println("E ", E)
println(E[2][3])

mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    # Denne konstruktøren tilsvarer Make_set() fra boka
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end


println("Datatype for task 4")
result = Vector{Vector{Int}}()

push!(result, [1, 2, 3])
push!(result, [1, 2, 3])
push!(result, [1, 2, 3])
println(result)
# How do we alter the innmat of a sublist?
push!(result[1], 10)
println(result[1][4])
result[2][2] = 11
println(result)
# Useful operations
if 11 in result[2]
    println("sure thing")
end
vec = Vector{Vector{Int}}()
for i in 1:10
    for j in 1:3
        try
            push!(vec[i], j)
        catch
            push!(vec, [j])
        end
    end
end
println(vec)

vec2 = Vector{DisjointSetNode}()
push!(vec2, DisjointSetNode())
push!(vec2, DisjointSetNode())
push!(vec2, DisjointSetNode())
vec2[1].rank = 1
vec2[2].p = vec2[1]
vec2[3].p = vec2[1]
try
    println(vec2[4])
    println("oh no!")
catch
    println("oh no!")
end




"""
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

"""