"""
Question 1: Finne lengden på den lengste strengt økende delfølgen

lislength = longest increasing subsequence

Merk! For [5,3,3,6,7] er 3 rett svar, med løsningene [3,6,7] og [5,6,7], 
ettersom tallene ikke trenger å være sammenhengende i den originale følgen

Bruker dynamisk progging, bottum up, for kjøretid O(n^2), bruker vi top-down divide and conquor får vi O(2^n) 😱!
"""



function lislength(s)
    # Endimensjonalt problem!
    # Lager den en liste, mls, med nuller som er like lang som listen med tall vi får inn:
    #   -> Denne skal brukes til å lagre den lengste delfølgen som slutter med tallet som er på den samme indeksen.
    #   -> Indeks 1 er allerede satt til 1 siden den lengste delfølgen da er kun tallet selv
    #   -> For s = [5,3,3,6,7] blir mls = [1,1,1,2,3] til slutt
    mls = zeros(Int, size(s))
    mls[1] = 1
    for i = 2:length(s)
        # shortest possible substring is 1, itself.
        mls[i] = 1
        for j = 1:i-1
            if s[i] > s[j]
                # Plusser på mls[j] + 1 fordi vi også vet at s[i] > s[j]
                mls[i] = max(mls[i], mls[j] + 1)
            end
        end
    end
    # println("s:", s)
    # println("\t->mls:", mls)
    return maximum(mls) # Returnerer det største tallet i listen
end




### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test lislength([5,3,3,6,7]) == 3
	@test lislength([2,2,2,2]) == 1
	@test lislength([100,50,25,10]) == 1
	@test lislength([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) == 6
	@test lislength([682, 52, 230, 441, 1000, 22, 678, 695, 0, 681]) == 5
	@test lislength([441, 1000, 22, 678, 695, 0, 681, 956, 48, 587, 604, 857, 689, 346, 425, 513, 476, 917, 114, 43, 327, 172, 162, 76, 91, 869, 549, 883, 679, 812, 747, 862, 228, 368, 774, 838, 107, 738, 717, 25, 937, 927, 145, 44, 634, 557, 850, 965]) == 12
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")