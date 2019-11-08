# PQ
using DataStructures: PriorityQueue, enqueue!, dequeue!

Q = PriorityQueue{String, Int}()
enqueue!(Q, "nei", 3) 
enqueue!(Q, "ja", 4)
P = PriorityQueue{String, Int}()
dequeue!(Q)
dequeue!(Q)


if Q == P
    println("yes")
else
    println("no")
end