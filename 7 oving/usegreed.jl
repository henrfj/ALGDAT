"""
Veksleproblemet:
->  Vi definerer en instans av dette problemet som {S,v} hvor S er mengden mynter vi har tilgjengelig, og v er verdien vi ønsker å gi ut.
->  I denne øvingen vil alle myntsett være spesifisert på formen S={c1,c2,…,cn}, med c1>c2>…>cn=1. 
    Altså vil de alltid være sortert i synkende rekkefølge, og vil alltid slutte med 1, slik at alle beløp kan veksles ut. 
->  Alle beløp og myntenheter vil alltid være ikke-negative heltall.
"""

function usegreed(coins)
    """
    param coins: Mengden mynter vi har tilgjengelig.
    return true eller false basert på om man burde bruke den grådeige algoritmen
            Den tester en tilstrekkelig betingelse, ikke en nødvendig en (safe test)
    """
    for i in 1:length(coins)-1
        # iterates through all but last index
        if coins[i] % coins[i+1] != 0
            # So if we find a smaller coin that is not a "fraction" of the next, bigger coin
            # we can't necessarily use greed
            return false
        end
    end
    return true
end





"""
### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test usegreed([20, 10, 5, 1]) == true
  @test usegreed([20, 15, 10, 5, 1]) == false
  @test usegreed([100, 1]) == true
  @test usegreed([5, 4, 3, 2, 1]) == false
  @test usegreed([1]) == true

end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
"""