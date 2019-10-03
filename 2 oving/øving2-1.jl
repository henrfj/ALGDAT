# Lenket liste; node som struct, traversering og oppretting av ny
try
    mutable struct Node
        next::Union{Node, Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
        value::Int
    end
catch e end

try
    mutable struct NodeDoublyLinked
        prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
        next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
        value::Int # Verdien til noden
    end
catch e end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
    end
    return node
end

# Skriv koden din her!
function findindexinlist(linkedlist, index)
    current = linkedlist

    for i in 1:(index-1) 
        if current.next == nothing
            return -1
        end
        current = current.next
    end

    return current.value
end



## Du skal implementere denne funksjonen 
function maxofdoublelinkedlist(linkedlist)
    max = linkedlist.value
    current = linkedlist
    while current != nothing
        if current.value > max
            max = current.value
        end    
        current = current.next
    end
    current = linkedlist.prev
    while current != nothing
        if current.value > max
            max = current.value
        end    
        current = current.prev
    end
    return max
end


### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

## Simple doubly linked chain
# Generated from the tail of the list
#                     prev     next     value
n3 = NodeDoublyLinked(nothing, nothing, 100)
n2 = NodeDoublyLinked(nothing, n3, 10)
n1 = NodeDoublyLinked(nothing, n2, 1)
n3.prev = n2
n2.prev = n1 

using Test
printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)
@testset "Basic tests" begin
    @test maxofdoublelinkedlist(n1) == 100
    @test maxofdoublelinkedlist(n2) == 100
    @test maxofdoublelinkedlist(n3) == 100
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n")
© 2019 GitHub, Inc.