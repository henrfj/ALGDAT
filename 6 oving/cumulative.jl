"""
Question 3: Finn vektene 🏋️

Skal skalere et bilde ved å fjerne de minst viktige pikslene (gitt vekter).
Metoden kalles "Seam carving". Finn den letteste stien gjennom en vekt-matrise!
Hva som er den letteste stien inn i en piksel er avhengig av hva som er den letteste stien inn i de tre pikslene over.
Vår funksjon skal ta inn matrise, 
og returnerer en matrise der hver celle er vekten på den letteste stien vi kan få dersom vi ender en sti i den cellen,
en sti som starter i en av top-cellene.


Merk! En sånn matrise er det vi får av å løse et vilkårlig 2d-dynamisk programmeringsproblem
"""



# For debugging
function printmatrix(M)
    """
    Author of this printmatrix is Eirik-ff,
    give him a follow on github, he deserves some luv 💕
    (He doesn't get much elsewhere)
    """
    rows, cols = size(M)
    for i = 1:rows
        for j = 1:cols
            print(M[i, j], " ")
        end
        println()
    end 
end


function cumulative(weights)
    # copy weights matrix,
    # as the cells in the return matrix is atleast the weights in weights matrix.
    # (only upper row actually has the same weights) 

    # ♟️Path map is almost pronounced pat mat, like in *russian* chessmate ♟️
    path_map = copy(weights)
    
    rows, cols = size(weights)
    for y = 2:rows
        # iterate through rows, no need to look at upper row as it is identical
        # for ♟️path map♟️ and weights matrix
        
        # column 1, has no element above to the left
        path_map[y, 1] += minimum( path_map[y-1, 1:2] )
        
        # last column, has no element above to the right
        path_map[y, end] += minimum( path_map[y-1, end-1:end] )

        # iterate through the elements between the edges
        for x = 2:cols-1
            m = minimum(path_map[ y-1, x-1:x+1 ])
            path_map[y, x] += m
        end
    end
return path_map
end


### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test cumulative([1 1 ; 1 1]) == [1 1 ;2 2]
    #Dette er samme eksempel som det vist i oppgaveteskten
	@test cumulative([3  6  8 6 3; 7  6  5 7 3; 4  10 4 1 6; 10 4  3 1 2;6  1  7 3 9])== [3  6  8  6  3;10 9  11 10 6;13 19 13 7  12;23 17 10 8  9;23 11 15 11 17]
end


println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")