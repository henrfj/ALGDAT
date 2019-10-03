
function insertion_sort!(A) 
    #Konvensjon at call by referance bruker !
    for j in 2:length(A)
        key = A[j]  
        i = j - 1
        while (i > 0 && A[i] > key)
            A[i+1] = A[i]
            i = i - 1
        end
        A[i+1] = key
    end
end

list = [1,9,4,2,3,1,2,2,1,19]

println(list)
insertion_sort!(list)
println(list)