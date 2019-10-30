"""
En av de mulige anvendelsene til minimale spenntrær er klyngeanalyse, (eng: clustering)
Pseudokode s571 i boka.
=> OBS! løste alle oppgavene i samme fil pga. latskap
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
        append!(nodes, [node])
    end

    # Sorted by the weight, nondecreasingly
    sort!(E)

    # In the beginning all nodes are in independet sets
    independet_sets = length(nodelist)
    
    # Unifies the nodes of nodelist, until we have k sets left.
    j = 1
    while independet_sets > k
        u = E[j][2]
        v = E[j][3]
        if findset(u) != findset(v)
            union!(nodes[u], nodes[v])
            independet_sets -= 1
        end
        j += 1
        if j > length(E)
            break
        ends
    end

    # Make a correct return-format
    return_list = Vector{Vector{DisjointSetNode}()}()
    for node in nodelist
        if findset(u) == findset(v)
            

        end
    end


end

