# Visste du at funksjoner kan ha emoji i navnet?  💯


function reverseandlimit(array, maxnumber)
    s = []
    for i in 0:(length(array)-1)
        elem = array[length(array)-i]
        if elem <= maxnumber
            push!(s, elem)
        else
            push!(s, maxnumber)
        end
    
    end
    return s
end

println(reverseandlimit([1, 2, 3, 4, 5, 6, 7, 8, 9], 2))
