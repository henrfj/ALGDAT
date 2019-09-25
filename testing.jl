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

function binarysearch_lower(x, left, right, value, coordinate)
    # Searching for a value worth less than value, return next index
    if left <= right
        q = Int(floor((left+right)/2))
        if x[q, coordinate] < value && x[q+1, coordinate] >= value
            return q + 1
        elseif value <= x[q, coordinate]
            return binarysearch_lower(x, left, q - 1, value, coordinate)
        else
            return binarysearch_lower(x, q + 1, right, value, coordinate)
        end
    else
        return -1
    end
end


A = [1 9; 2 3; 5 100; 7 1; 9 0; 9 2; 10 5; 10 78; 18 4; 19 27; 111 9; 373 17; 1003 1]
B = [2 2; 10 5; 21 78; 8 4;12 12]
println(binarysearch_lower(A, 1, length(A)/2, 10, 1))