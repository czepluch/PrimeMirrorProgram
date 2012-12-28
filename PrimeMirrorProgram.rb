require "prime"

puts "For how many primes do you wish to run program?"
times = gets.to_i

def get_mirror(number)
    number.to_s.reverse.to_i
end

def get_binary(number)
    number.to_s(2)
end

def get_binary_mirror(number)
    number.to_s(2).reverse
end

def prime_number(number)
    p_arr = Prime.first number
    if p_arr.include?(number)
        p_arr.index(number) + 1
    end
end

def get_product(number)
    n_arr = number.to_s.split("").map(&:to_i)
    n_arr.inject(:*)
end

# Check if the mirror is mirror
def mirror?(number)
    f = prime_number(number)
    l = prime_number(get_mirror(number)).to_s

    if  f == l.reverse.to_i
        return true
    end
end

def prime_tester(number)
    if number.prime? && get_mirror(number).prime? &&
        get_binary(number) == get_binary_mirror(number) && prime_number(number) == get_product(number) &&
            mirror?(number)
                puts "The number #{number} is prime number #{prime_number(number)}."
                puts "Its mirror, #{get_mirror(number)} is prime number #{prime_number(get_mirror(number))}."
                puts "And its mirror #{prime_number(number)} is the product of - hang on to your hats - #{number}."
                puts "In binary, #{number} is a palindrome: #{get_binary(number)}, which backwards is #{get_binary_mirror(number)}."
                puts "Exactly the same."
    end
end

Prime.each(times) do |number|
    prime_tester(number)
end
