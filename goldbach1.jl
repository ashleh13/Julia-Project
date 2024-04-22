# Function to check if a number is prime
function is_prime(n)
    if n <= 1
        return false
    end
    for i in 2:floor(Int, sqrt(n))
        if n % i == 0
            return false
        end
    end
    return true
end

# Function to find all Goldbach pairs for a given even number
function goldbach_pairs(n)
    pairs = []
    for i in 2:n
        if is_prime(i) && is_prime(n - i)
            push!(pairs, (i, n - i))
        end
    end
    return pairs
end

# Main function to read input from file and find Goldbach pairs
function main(filename="data.txt")
    open(filename) do file
        for line in eachline(file)
            n = parse(Int, line)
            pairs = goldbach_pairs(n)
            println("We found $(length(pairs)) Goldbach pair(s) for $n.")
            for pair in pairs
                println("$n = $(pair[1]) + $(pair[2])")
            end
        end
    end
end

# Example usage
if length(ARGS) == 0
    main()  # If no arguments are provided, use default file name "data.txt"
else
    main(ARGS[1])  # Otherwise, use the provided file name
end
