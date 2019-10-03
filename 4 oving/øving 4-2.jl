"""Stabil tellesortering på streng etter lengde"""

function max_len(A)
    max_len = length(A[1])
    for elem in A
        if length(elem) > max_len
            max_len = length(elem)
        end
    end
    return max_len
end

function countingsortlength(A)
    C = fill(0, max_len(A)+1)
    B = fill("", length(A))
    for j in 1:length(A)
        C[length(A[j])+1] += 1
    end

    for i in 2:max_len(A)+1
        C[i] += C[i - 1]
    end
    # C is now cumelative, with C[i] containing number of elements less or equal to i
    for j in length(A):-1:1
        B[C[length(A[j])+1]] = A[j]
        C[length(A[j])+1] -= 1
    end
    return B
end

println(countingsortlength(["bbbb", "aa", "aaaa", "ccc"]))