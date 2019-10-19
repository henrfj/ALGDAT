include("./usegreed.jl")
include("./mincoinsgreed.jl")
include("./mincoins.jl")

println(mincoinsgreedy([20,10,5,1],99) == 10)