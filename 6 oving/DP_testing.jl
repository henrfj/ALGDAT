"""
Your mind is dirty, not mine
"""

M = [3 6 8 6 3; 10 9 11 10 6; 13 19 13 7 12; 23 17 10 8 9; 23 11 15 11 17]

# println(M[3, 1:end ])
# println(argmin(M[3, 1:end]))

# Hva om to element er like mye verdt?
println(M[1, 1:end ])
println(argmin(M[1, 1:end]))
# => Returnerer den første

println(M[3, 3:5 ])
println(argmin(M[3, 3:5]))

