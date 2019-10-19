"""
Implement basic greedy algorithm
"""

function mincoinsgreedy(coins, value)
    """
    param coins: list of coin-values
    param value: a value to be exchanged into coins
    return: the greedy solution of how few coin-values are needed to cover "value"
    """
    count = 0
    for coin in coins
        while value >= coin
            value -= coin
            count += 1
        end
        if value == 0
            # Just for optimization
            break
        end
    end
   return count
end

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test mincoinsgreedy([1000,500,100,20,5,1],1226) == 6
  @test mincoinsgreedy([20,10,5,1],99) == 10
  @test mincoinsgreedy([5,1],133) == 29
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")