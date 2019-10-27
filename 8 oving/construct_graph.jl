"""
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
    # Vi lager en matrise nodearray med størrelse tilsvarende maze,
    # men med Node-objekter isteden
    nodearray = Array{Node}(undef, size(maze, 1), size(maze, 2))

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            # Fyll inn kode for å oppdatere nodearray
        end
    end

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
            # Fyll inn kode for å oppdatere neighbors til hver node
            # (Husk at naboene alltid er rett over, rett under,
            #  rett til venstre og/eller rett til høyre)
        end
    end

    # Fyll inn kode for å returnere en nodeliste ut ifra nodearray
end