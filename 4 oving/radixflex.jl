"""Flexible radix sort function: gir leksikalsk sortering av liste med strenger"""

function flexradix(A, maxlength)
    # First we sort by length, as a shorter word has precedence over a longer word
    # Ex: arr > arra
    B = countingsortlength(A)
    B = [rpad(s, maxlength, '`') for s in A]
    # Then i pad by `, as no other char has precedence over it; and we have a stable sorting algorithm

    for i in maxlength:-1:1
        B = countingsortletters(B, i)
    end

    # Then we remove the padding
    B = [string(rstrip(s, '`')) for s in B]
    
    return B
end



# Needed to rework my countingsortletters, the padding gives ` and the chartodigit returns 0, whcih is not a index in julia
function countingsortletters(A, position)
    An_pos = [chartodigit(s[position]) for s in A]
    B = ["" for i in A]  # output, make same size as A
    M = maximum(An_pos)
    # counting array
    # length needs to be 1 more than maximum because it's supposed to 0-indexed
    # thus, because arrays are 1-index in julia, we need to add 1 to the index
    # every time we want to index C
    C = [0 for i=1:M+1]  

    # count occurances of each item in A
    for i = 1:size(An_pos, 1)
        C[An_pos[i] + 1] += 1
    end

    # make count cummulative
    for i = 1:M
        C[i+1] = C[i+1] + C[i]
    end

    for i = size(An_pos, 1):-1:1
        # assigning A to position in B because we're only using the values
        # in An_pos to sort by
        B[ C[ An_pos[i] + 1 ] ] = A[i]
        C[ An_pos[i] + 1 ] -= 1
    end

    return B
end
function chartodigit(character)
    return character - '`'
end
function countingsortlength(A)
    Al = [length(s) for s in A]
    B = ["" for s in A]  # output, make same size as A
    M = maximum(Al)
    C = [0 for i=1:M+1]

    # count elements in Al
    for i = 1:length(Al)
        C[ Al[i] + 1 ] += 1
    end

    # make cummulative count
    for i = 1:M
        C[i+1] = C[i+1] + C[i]
    end

    for i = length(Al):-1:1
        B[ C[ Al[i] + 1 ] ] = A[i] 
        C[ Al[i] + 1 ] -= 1
    end

    return B
end




## TESTING
A = ["kobra", "aggie", "agg", "kort", "hyblen"]
maxlength = 6
println("Sorting A=$(A) with maxlength=$maxlength")
res = flexradix(A, maxlength) 
println("Result from sorting: $(res)")
@assert res == ["agg", "aggie", "hyblen", "kobra", "kort"]
println("Assert passed!")
