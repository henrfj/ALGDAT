"""
En av de mulige anvendelsene til minimale spenntrær er klyngeanalyse, (eng: clustering)
Pseudokode s571 i boka.

=> OBS! Les dette:

1) løste alle oppgavene i samme fil pga. latskap

2) Datatypen du vil bruke: 2d_vector = Vector{Vector{Int}}()

"""

mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    # Denne konstruktøren tilsvarer Make_set() fra boka
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

function findset(x)
    # Returnerer super-daddy'en til x
    # Alle Noder langs stien opp til Super-daddy blir og direkte lenket til superdaddy!
    if x != x.p
        x.p = findset(x.p)
    end
    return x.p
end

function union!(x, y)
    # Linker sammen x og y sine super-daddies,
    # altså henger sammen de to settene som x og y er med i
    link(findset(x), findset(y))
end

function link(x, y)
    # Tar inn to superdaddies og smekker de sammen etter rank
    # Er ranken lik settes x under y og y sin rank øker med 1.
    if x.rank > y.rank
        y.p = x
    
    else
        x.p = y
        if x.rank == y.rank
            y.rank += 1
        end
    end
end


function hammingdistance(s1, s2)
    # Returnerer antall ulike elementer på lik index mellom de to strengene.
    # De er like lange 🤣
    count = 0
    for i in 1:length(s1)
        if s1[i] != s2[i]
            count += 1
        end
    end
    return count
end

# The final boss: klyngefinderen 😱
# Needed some little helpers for this one 
function parents_printer(node, nodes)
    for i in 1:length(nodes)
        if nodes[i] == node.p
            print(" ", i)
        end
    end
    print("\n")
end

function node_printer(nodes)
    for i in 1:length(nodes)
        print("Node: ", i, "\tParent: ") 
        parents_printer(nodes[i], nodes)
    end
end


function findclusters(E, n, k)
    """


    param E: liste med kantene,(ekvivalent indeksert som 2d-liste i python) 
        på form (w,u,v), der w er vekt på kant u-->v
    param n: antall Noder.
    param k: antall klynger vi skal finne. 1<=k<=n
    returnerer: liste av grupperingene. De skal ha maksimal spennavstand.
    (Bruk Kruskals algoritme og avslutte når det gjennstår k trær)
    """

    nodes = Vector{DisjointSetNode}()
    for i in 1:n
        node = DisjointSetNode()
        push!(nodes, node)
    end

    # Sorted by the weight, nondecreasingly
    sort!(E)

    # In the beginning all nodes are in independet sets
    subsets = n
    
    # Unifies the nodes of nodes, until we have k sets left.
    j = 1
    while subsets > k
        # Index of nodes-vector is it's number
        u = nodes[E[j][2]]
        v = nodes[E[j][3]]
        if findset(u) != findset(v)
            union!(u, v)
            subsets -= 1
        end
        j += 1
        if j > length(E)
            break
        end
    end

    # Some might call this ad-hoc...!
    # Now all nodes are guaranteed to be part of 2-deep span-trees, not deeper...
    for node in nodes
        findset(node)
    end

    # Make a correct return-format
    # At this pint all nodes in our sets should belong to a 2-level tall tree
    # as findset() breaks down the three-structure => we should also have exactly k superdaddies
    return_list = Vector{Vector{Int}}()
    sub_array_num = 0
    for i in 1:n
        if nodes[i].p == nodes[i]
            # It is a superdaddy!
            sub_array_num += 1
            for j in 1:n
                if nodes[j].p == nodes[i]
                    try
                        push!(return_list[sub_array_num], j)
                    catch e
                        push!(return_list, [j])
                    end
                end
            end
        end
    end
    return return_list
end

function findanimalgroups(animals, k)
    """
    param animals: liste av tupler => ("dyr", "DNA")
    param k: antall klynger
    return: liste lik den i findclusters, men med dyrenavn
    """
    E = Vector{Tuple}()
    n = length(animals)

    for i in 1:n
        for j in 1:n
            if i != j
                w = hammingdistance(animals[i][2], animals[j][2])
                push!(E, (w, i, j))
            end
        end
    end

    grouping_int = findclusters(E, n, k)
    grouping_str = Vector{Vector{String}}()
    for i in 1:length(grouping_int)
        for j in 1:length(grouping_int[i])
            try 
                push!(grouping_str[i], animals[grouping_int[i][j]][1])
            catch
                push!(grouping_str, [animals[grouping_int[i][j]][1]])
            end
        end
    end
    return grouping_str
end

# findanimalgroups([("Ugle", "CGGCACGT"), ("Elg", "ATTTGACA"), ("Hjort", "AATAGGCC")], 2)


### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)


using Test
@testset "Tester" begin
    @test sort([sort(x) for x in findanimalgroups([("Ugle", "CGGCACGT"), ("Elg", "ATTTGACA"), ("Hjort", "AATAGGCC")], 2)]) == sort([["Ugle"], ["Elg", "Hjort"]])

    @test sort([sort(x) for x in findanimalgroups([("Hval", "CGCACATA"), ("Ulv", "AGAAACCT"), ("Delfin", "GGCACATA"), ("Hund", "GGAGACAA"), 
    ("Katt", "TAACGCCA"), ("Leopard", "TAACGCCT")], 3)]) == sort([["Hund", "Ulv"], ["Delfin", "Hval"], ["Katt", "Leopard"]])
end

println("\nFungerte det? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke sjekker alle grensetilfellene")
println("---------------------------------------------------------\n\n")
