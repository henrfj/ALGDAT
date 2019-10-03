# x og y er to sorterte tabeller etter koordinatet, coordinate angir koordinat
function mergearrays(x,y,coordinate)
    A = reshape([], (0, 2))         # Lager en 0x2 liste ~ Øx2
    l = length(x)/2 + length(y)/2   # Length is total length in both dimentions, must be devided to get #columns
    x = [x; [Inf Inf]]              # This is done to avoid having to check if we have already added the last obect of x or y
    y = [y; [Inf Inf]]              # as no element in x or y can be bigger than Inf

    i = 1
    j = 1
    for k in 1:l                                    # Just running it l times
        if x[i, coordinate] <= y[j, coordinate]     # Must convert back to integer as Inf is Float64 type
            A = [A; [convert(Int64, x[i,1]) convert(Int64, x[i,2])]]    
            i = i + 1
        else
            A = [A; [convert(Int64, y[j,1]) convert(Int64, y[j,2])]]    
            j = j + 1
        end
    end
    return A
end


A = [1 9; 3 3; 5 100; 7 1; 9 0]
B = [2 2; 4 5; 6 78; 8 4; 10 7]
# println(mergearrays(A, B, 1))

C = [1 9; 3 33; 5 100; 7 111; 9 112]
D = [2 2; 4 5; 6 78; 8 400; 10 700]
# println(mergearrays(C, D, 2))


# x er en usortert tabell, coordinate angir koordinat vi skal sortere langs
# traverserer rekursjonstreet som en depth-first algoritme
function mergesort(x, coordinate)
    if length(x) > 2    #As if there is one element left, length is 2 (2 in each row)
        q = convert(Int64, floor(length(x) / 4))
        a = mergesort(x[1:q, :], coordinate)
        b = mergesort(x[(q+1):end, :], coordinate)
        return mergearrays(a, b, coordinate)
    end
    return x
end




E = [1 9; 3 3; 5 100; 7 1; 9 0; 2 2; 4 5; 6 78; 8 4]
println(typeof(E))
F = mergesort(E, 2)
println(F)
