# THIS TEST IS SOLID GOLD!
# LA STÅ
# --------------------------------------------------------
A = [1 9; 7 3; 5 100; 7 1; 9 0; 2 2; 4 5; 6 78; 8 4; 10 7; 11 9; 17 17]
B = [2 2; 10 5; 21 78; 8 4;12 12]

C = [1 9; 3 33; 5 100; 7 111; 9 112; 12 12]
D = []

x = A[1:3, :]
y = A[4:end, :]
# println(x)
# println(y)
# --------------------------------------------------------
yleft  = zeros(typeof(y[1]), (0, 2))

# println(yleft)

# --------------------------------------------------------
function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.
    #` er bokstaven rett før a i ASCII, slik at a blir 1
    return character - '`'
end

C = []
for i in 1:26
    push!(C, 0)
end

# C = zeros(typeof(1), (26, 1))
# dett blir en matrise

# println(C)
A = ["hai", "nzi", "skje", "felt", "hodetelefon", "sylofon"]
#print(A[5][5])

for j in 1:length(A)
    C[chartodigit(A[j][2])] += 1
end

for j in length(A):-1:1
    println(j)
end