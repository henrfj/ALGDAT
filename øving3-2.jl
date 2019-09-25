function binaryintervalsearch(x, delta, coordinate)
    # We assume that 2d list x contains only integers!
    if length(x) == 0
        println("Meh")
        return [-1 -1]
    end
    
    median = median_finder(x, coordinate)   #Return [median median_index]
    low_value = ceil(median[1] - delta)
    high_value = floor(median[1] + delta)
    
    lower_index = binarysearch_lower(x, 1, median[2], low_value, coordinate)
    higher_index = binarysearch_higher(x, median[2]+1, length(x)/2, high_value, coordinate)

    if lower_index>higher_index
        return [-1 -1]
    end
    return [lower_index higher_index]

end


function median_finder(x, coordinate)
    # returns [median median_index]
    len = Int(length(x)/2)
    if (len % 2 != 0)
        # not even length
        return [(x[Int(ceil(len/2)), coordinate]) (Int(ceil(len/2)))]
    else
        # Even length. Return the lower index
        return [((x[Int(len/2), coordinate] + x[Int(len/2) + 1, coordinate])/2) (Int(len/2))]
    end
end

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
        return Int(left)    #This happends if all values are within delta-range
    end
end

function binarysearch_higher(x, left, right, value, coordinate)
    # Searching for a value worth more than value, return previous index
    if left <= right
        q = Int(floor((left+right)/2))
        if x[q, coordinate] > value && x[q-1, coordinate] <= value
            return q - 1
        elseif value < x[q, coordinate]
            return binarysearch_higher(x, left, q - 1, value, coordinate)
        else
            return binarysearch_higher(x, q + 1, right, value, coordinate)
        end
    else
        return Int(right)   #This happends if all values are within delta-range
    end
end



# TESTING GROUNDS
A = [1 9; 2 3; 3 100; 4 1; 5 0; 6 9] # Sorted by coordinate = 1
B = [2 2; 10 3; 21 7; 8 11; 12 12]                                       # Sorted by coordinate = 2

C = [1 9; 3 33; 5 100; 7 111; 9 112; 12 12]
D = []

println(binaryintervalsearch(A, 1, 1))
println(binaryintervalsearch(B, 5, 2))
println(binaryintervalsearch([1 2; 2 0; 3 3; 4 4], 0.25, 1))