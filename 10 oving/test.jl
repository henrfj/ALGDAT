# PQ
using DataStructures: PriorityQueue, enqueue!, dequeue!, peek

I = []
push!(I, "hei")
push!(I, "paa")
push!(I, "deg")
push!(I, "din")
push!(I, "gamle")
push!(I, "sei")
push!(I, "!")
println(I)
filter!(x->x!="!", I)   # Cool function, I guess
println(I)

Q = PriorityQueue{String, Int}()
enqueue!(Q, "nei", 3) 
enqueue!(Q, "ja", 4)
enqueue!(Q, "Ma" => 15)
enqueue!(Q, "Pa" => 115)
enqueue!(Q, "hhhh" => 21)


println(Q)

for i in 1:4
    println("peek: ", peek(Q))
    println("dequeue: ", dequeue!(Q))
    
end
delete!(Q, "Pa")
println(Q)