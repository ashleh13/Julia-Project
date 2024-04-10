#This is where we will collaborate on the goldbach code


function get_primes(max_number)
    primes = Int[]
    for value in 2:max_number
        is_prime = true
        for prime in primes
            if value % prime == 0
                is_prime = false
                break
            end
        end
        if is_prime
            push!(primes, value)
        end
    end
        return primes   
end

function goldbach(value)
    result = Int[]
    if value >= 4 && value % 2 == 0
        primes = get_primes(value)
        for prime in primes
            if prime > value /2
                break
            end
            difference = value - prime
            if difference in primes
                push!(result, prime)
            end 
        end
    end
    return result
end 

function main()
    data = Int[]
    if length(ARGS) > 0
        for filename in ARGS
            append!(data, readfile(filename))
        end
    else
        data = [3, 4, 14, 26, 100]
    end
    for value in data
        print_goldbach(value, goldbach(value))
    end
end

function print_goldbach(value, prime_list)
    if isempty(prime_list)
        println("We found no Goldbach pairs for $value.")
    else
        println("We found $(length(prime_list)) Goldbach pair(s) for $value.")
        for prime in prime_list
            difference = value - prime
            println("$value = $prime + $difference")
        end
    end
    println()
end

function readfile(filename)
    data = Int[]
    open(filename) do file_handle
    for line in eachline(file_handle)
        push!(data, parse(Int, strip(line)))
        end
    end
    return data
end

main()

