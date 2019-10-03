# Brute force distance

function bruteforce(x)
    # x is a 2d matrix
    min = Inf
    for i in 1:Int((length(x)/2))
        for j in i+1:Int((length(x)/2 - i+1))
            d = distance(x[i, :], x[j, :])
            if d < min
                min = d
            end
        end
    end
    return min
end

function distance(a, b)
    # Returns pythagorian distance between two 2-dimentional coordinates
    return sqrt(((a[1]-b[1])^2) + ((a[2]-b[2])^2))
end

x = [1 1; 10 0; 2 2; 5 5]
println(bruteforce(x))