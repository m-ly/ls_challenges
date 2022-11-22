

# classes needed PerfectNumber
#   # methods needed 
#     # initialize ()  
#        - when classify is called on a negative number, an error is raised
#     # classify  - input is an integer (greater than 0 )
#       --

# input -> an integer
# output -> a string - perfect,  abundant or defictient dependant on outcome of classify

# rules 
#   prime numbers are deficient 
#   A number is perfect number if the sum of all its divisors equals the number
#   A number is an abundant number if the sum of all its divisors is greater than the number
#   A number is a deficient number if the sum of all its divisors is less than the number
#   input for classify must be a positive number

# data - 
# integer
# array
# string

# algorithm
#  classify -
#     initialize a results array 
#     input -> an integer (must be greater than 0
#     from the range of 1 upto (not including) input if the number divides into input evenly, return the number to the results array
#     find the sum of the results array
#       if the sum is greater than input return abundant
#       if the sum is less than input return deficient 
#       if the sum is equal to input return perfect


class PerfectNumber
  def self.classify(int)
    raise StandardError if int < 0

    total = sum_of_all_factors(int)
    
    if total > int
      'abundant'
    elsif total < int
      'deficient'
    else 
      'perfect'
    end
  end 

  def self.sum_of_all_factors(int)
    results = []
    (1...int).each do |num|
      results << num if int % num == 0
    end
   
    results.sum
  end

end 
