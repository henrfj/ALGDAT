"""Implementering av counting sort på strenger"""

A = ["hei", "nei", "skje", "felt", "hodetelefon", "sylofon"]

function countingsortletters(A,position)
    # Antar at alle element i A er lange nok til å inneholde 'position'
    # Anta at alle bokstaver i strengene er mellom a og z
    C = fill(0, 26)
    B = fill("", length(A))
    for j in 1:length(A)
        C[chartodigit(A[j][position])] += 1
    end

    for i in 2:26
        C[i] += C[i - 1]
    end
    # C is now cumelative, with C[i] containing number of elements less or equal to i
    for j in length(A):-1:1
        B[C[chartodigit(A[j][position])]] = A[j]
        C[chartodigit(A[j][position])] -= 1
    end
    return B
end



function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.
    #` er bokstaven rett før a i ASCII, slik at a blir 1
    return character - '`'
end



println(A)
println(countingsortletters(A,2))