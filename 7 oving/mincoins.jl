"""
En mer generell metode for å finne mincoins. Bruker DP (if you know what I mean)
"""

function usegreed(coins)
  for i in 1:length(coins)-1
    if coins[i] % coins[i+1] != 0
      return false
    end
  end
  return true
end

function mincoinsgreedy(coins, value)
  count = 0
  for coin in coins
    while value >= coin
      value -= coin
      count += 1
    end
  end
  return count
end

"""
DP:

Starter med nederste delproblem, som er å skulle fylle opp value = 1.
For hver iterasjon går vi opp et nivå, til å fylle opp value = value + 1
Da kan vi alltids push!(counts, counts[i-1]+1), som er løsningen der vi bare slenger på en ener.
Men hvis vi finner en bedre løsning, så bytter vi ut denne løsningen.

=>  hvordan finner vi en bedre løsning?
    Vi undersøker om vi kan trekke fra verdien av coin,
    og så bruke en tidligere løsning, som vil gi en lavere antall
    coins enn den vi har nå. (målet er en lavest mulig count!)
"""


function mincoinsdynamic(coins, value)
  counts=[0]
  for i in 2:value+1
    push!(counts, counts[i-1]+1)
    for coin in coins
      if coin < i && counts[i-coin]+1<counts[i]
        counts[i] = counts[i-coin]+1
      end
    end
  end
  return counts[value+1]
end


function mincoins(coins, value)
  inf = typemax(Int)
  if usegreed(coins)
    return mincoinsgreedy(coins, value)
  end
  return mincoinsdynamic(coins, value) 
end



### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test mincoins([4,3,1],18) == 5
  @test mincoins([1000,500,100,30,7,1],14) == 2
  @test mincoins([40, 30, 20, 10, 1], 90) == 3
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")