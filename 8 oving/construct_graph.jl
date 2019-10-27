"""
OBS! Kronglete shit mtp. appending av listene.

BFS gir garantert korteste vei i en uvektet graf. 
I denne øvingen skal vi derfor bruke BFS til å finne korteste vei melllom to punkter i en labyrint,
ved å først representere labyrinten som en graf,
og deretter bruke BFS til å finne den korteste veien mellom de to punktene.
"""

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


function mazetonodelist(maze)
    """
    param: maze er en 2d matrise av labyrinten. 0 er vegg, 1 er gulv. 
    """

    # Make a matrix similar to the maze, but filled with node-objects
    nodearray = Array{Node}(undef, size(maze, 1), size(maze, 2))

    # Make nodearray
    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if maze[i, j] == 1
                nodearray[i, j] = Node(i, j)
            end
        end
    end

    

    # Update neighbors
    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if maze[i, j] == 1
                
                # Nodes to the left
                if i != 1
                    if maze[i - 1, j] == 1
                        # append!(nodearray[i, j].neighbors, nodearray[i - 1, j])
                        resize!(nodearray[i, j].neighbors, length(nodearray[i, j].neighbors) + 1)
                        nodearray[i, j].neighbors[length(nodearray[i, j].neighbors)] = nodearray[i - 1, j]
                    end
                end
                
                # Node to the right
                if i != size(maze, 1)
                    if maze[i + 1, j] == 1
                        # append!(nodearray[i, j].neighbors, nodearray[i + 1, j])
                        resize!(nodearray[i, j].neighbors, length(nodearray[i, j].neighbors) + 1)
                        nodearray[i, j].neighbors[length(nodearray[i, j].neighbors)] = nodearray[i + 1, j]
                    end
                end

                # Node above
                if j != 1
                    if maze[i, j - 1] == 1
                        # append!(nodearray[i, j].neighbors, nodearray[i, j - 1])
                        resize!(nodearray[i, j].neighbors, length(nodearray[i, j].neighbors) + 1)
                        nodearray[i, j].neighbors[length(nodearray[i, j].neighbors)] = nodearray[i, j - 1]
                        
                    end
                end

                # Node below
                if j != size(maze, 2)
                    if maze[i, j + 1] == 1
                        # append!(nodearray[i, j].neighbors, nodearray[i, j + 1])
                        resize!(nodearray[i, j].neighbors, length(nodearray[i, j].neighbors) + 1)
                        nodearray[i, j].neighbors[length(nodearray[i, j].neighbors)] = nodearray[i, j + 1]
                    end
                end

            end

        end
    end
    
    
    # Make nodearray into a list
    nodelist = Array{Node}(undef, 0)
    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            if maze[i, j] == 1
                resize!(nodelist, length(nodelist) + 1)
                nodelist[length(nodelist)] = nodearray[i, j]
            end
        end
    end

    
    return nodelist
end


### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

# (Følgende er hjelpefunksjoner for testene og kan i utgangspunktet ignoreres)
function sortnodelist(nodelist)
    sort!(sort!(nodelist, by=node->node.i), by=node->node.j)
end

function getcoords(nodelist)
    return [(node.i, node.j) for node in nodelist]
end

function getneighborcoords(nodelist)
    return [sort(sort(
               [(neighbor.i, neighbor.j) for neighbor in node.neighbors],
            by = x -> x[1]), by = x -> x[2])
            for node in nodelist]
end

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "LitenLabyrint" begin
    maze = [0 0 0 0 0
            0 1 1 1 0
            0 1 0 0 0
            0 1 1 1 0
            0 0 0 0 0]
    nodelist = mazetonodelist(maze)

    # Test at nodelist er en liste/array med Node-instanser
    # Merk at følgende tester vil feile dersom dette ikke er tilfelet
    @test nodelist isa Array{Node,1}

    # Test at grafen inneholder riktig antall noder
    @test length(nodelist) == 7

    # Vi sorterer nodelist ut ifra koordinatene, ettersom vi ikke pålegger
    # en spesifikk rekkefølge på nodene i nodelist
    sortnodelist(nodelist)

    # Test at koordinatene til hver node er korrekte
    @test getcoords(nodelist) ==
        [(2, 2), (3, 2), (4, 2), (2, 3), (4, 3), (2, 4), (4, 4)]

    # Test at koordinatene til hver nabonode er korrekte
    @test getneighborcoords(nodelist) ==
        [[(3, 2), (2, 3)], [(2, 2), (4, 2)],
         [(3, 2), (4, 3)], [(2, 2), (2, 4)],
         [(4, 2), (4, 4)], [(2, 3)], [(4, 3)]]
end

@testset "MiddelsLabyrint" begin
    maze = [0 0 0 0 0 0 0
            0 1 1 1 1 1 0
            0 1 0 0 0 1 0
            0 1 0 1 0 1 0
            0 1 0 1 0 1 0
            0 1 1 1 0 1 0
            0 0 0 0 0 0 0]
    nodelist = mazetonodelist(maze)

    @test nodelist isa Array{Node,1}

    @test length(nodelist) == 17

    sortnodelist(nodelist)

    @test getcoords(nodelist) ==
        [(2, 2), (3, 2), (4, 2), (5, 2), (6, 2),
         (2, 3), (6, 3), (2, 4), (4, 4), (5, 4),
         (6, 4), (2, 5), (2, 6), (3, 6), (4, 6),
         (5, 6), (6, 6)]

    @test getneighborcoords(nodelist) ==
        [[(3, 2), (2, 3)], [(2, 2), (4, 2)], [(3, 2), (5, 2)],
         [(4, 2), (6, 2)], [(5, 2), (6, 3)], [(2, 2), (2, 4)],
         [(6, 2), (6, 4)], [(2, 3), (2, 5)], [(5, 4)],
         [(4, 4), (6, 4)], [(6, 3), (5, 4)], [(2, 4), (2, 6)],
         [(2, 5), (3, 6)], [(2, 6), (4, 6)], [(3, 6), (5, 6)],
         [(4, 6), (6, 6)], [(5, 6)]]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")

