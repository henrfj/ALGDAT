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

function binarysearch_lower(x, left, right, value)
    # Searching for a value worth less than value, return next index
    if left <= right
        q = Int(floor((left+right)/2))
        if x[q] < value && x[q+1] == value
            return q + 1
        elseif value < x[q]
            return binarysearch_lower(x, left, q - 1, value)
        else
            return binarysearch_lower(x, q + 1, right, value)
        end
    else
        return nothing
    end
end



A = [1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println(binarysearch_lower(A, 1, 13, 7))