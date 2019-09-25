function binaryintervalsearch(x, delta, coordinate)
    # We assume that 2d list x contains only integers!
    median = median_finder(x, coordinate)
    low_value = ceil(median[1] - delta)
    high_value = floor(median[1] + delta)
    

    lower_index = binarysearch_lower(x, 1, median[2], low_value )
    higher_index = binarysearch_higher(x, median[2]+1, high_value)

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


function binarysearch_lower(x, left, right, value)
    # Searching for a value worth less than value, return next index
    if left <= right
        q = floor((left+right)/2)
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

function binarysearch_higher(x, left, right, value)
    # Searching for a value worth more than value, return previous index


end

# TESTING GROUNDS

A = [1 9; 2 3; 3 100; 4 1; 5 0; 6 9] # Sorted by coordinate = 1
B = [2 2; 10 5; 21 7; 8 8; 12 12]                                       # Sorted by coordinate = 2

C = [1 9; 3 33; 5 100; 7 111; 9 112; 12 12]
D = []

binaryintervalsearch(A, 1, 1)
binaryintervalsearch(B, 3.5, 2)