# Task 4, splitting. Notice line 12 - that some real shit!

function splitintwo(x,y)
    x_left = x[1:Int(ceil(length(x)/4)), :]
    x_right = x[Int(ceil(length(x)/4)) + 1:end, : ]
    y_left = zeros(typeof(y[1]), (0, 2))
    y_right = zeros(typeof(y[1]), (0, 2))
    
    # Iterate through y
    for i = 1:size(y, 1)
        # element = [y[i,1] y[i,2]] This and the next line is  the same
        element = reshape(y[i, :], (1, 2))
        if inarray(element, x_left)
            y_left = [y_left; element]
        else
            y_right = [y_right; element]
        end
    end
    
    return x_left, x_right, y_left, y_right
end

# THIS INARRAY FUNCTION IS BEAUTIFULLY ENGINEERED BY @EIRIK-ff, PLZ FOLLOW HIM!

function inarray(sub, x)
    for i = 1:size(x, 1)
        xi = x[i, :]
        if sub[1] == xi[1] && sub[2] == xi[2]
            return true
        end
    end
    return false
end


x = [1.0 2.0; 1.0 3.0; 1.0 2.0; 1.0 5.0; 1.0 6.0; 1.0 1.0]
y = [1.0 1.0; 1.0 2.0; 1.0 2.0; 1.0 3.0; 1.0 5.0; 1.0 6.0]

a, b, c, d = splitintwo(x,y)

println(a, b, c, d)
