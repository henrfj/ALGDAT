

function dnasimilarity(s1, s2)
    """
    param s1, s2: strenger av lik lengde 
    return: antall like 'char' på lik posisjon i strengene s1 og s2
    """
    count = 0
    for i in 1:length(s1)
        if s1[i] == s2[i]
            count += 1
        end
    end
    return count
end

println(dnasimilarity("ATCG", "ATGC"))
println(dnasimilarity("ATATATA", "TATATAT"))
