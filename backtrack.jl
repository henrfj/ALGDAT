"""
Question 4: I forrige oppgave fant vi vektene, nå skal vi finne stiene.

Løsning:    nederste rad viser allerede letteste stien, den pushes til løsning-stien
            deretter velges bare minste av de tre over, for den viser jo korteste path videre opp mot toppen.
            Repeat!
"""


# For debugging
function printmatrix(M)
    print("\n[")
    rows, cols = size(M)
    for i = 1:rows
        for j = 1:cols
            if j == 1 && i != 1
                print(" ")
            end
            print(M[i, j]) 
            if j != cols || i != rows
                print(" ")
            end
        end
        if i != rows
            println()
        end
    end 
    println("]")
end



function backtrack(pathweights)
    path = []   # list of tuples representing coordinates in the matrix
    rows, cols = size(pathweights)

    # Argmin gir index til miste elements
    prev_step = argmin(pathweights[rows, 1:end])
    push!(path, (rows, prev_step))

    for y = rows-1:-1:1
        if prev_step == cols    # Altså vi er på høyre kant
            next_step = (prev_step - 2)  + argmin(pathweights[y, (prev_step-1):(prev_step)])
        
        elseif prev_step == 1   # Altså vi er på venstre kant
            next_step = (prev_step - 1) + argmin(pathweights[y, (prev_step):(prev_step+1)])

        else                    # Altså vi er i den fine midten
            next_step = (prev_step - 2) + argmin(pathweights[y, (prev_step-1):(prev_step+1)])
        end

        push!(path, (y, next_step))
        prev_step = next_step
    end
    return path
end




### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test backtrack([1 1 ; 2 2]) == [(2,1),(1,1)]
    #Dette er samme eksempel som det vist i oppgaveteskten
	@test backtrack([3  6  8  6  3; 10 9  11 10 6; 13 19 13 7  12; 23 17 10 8  9; 23 11 15 11 17]) == [(5,2), (4,3), (3,4), (2,5), (1,5)]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")