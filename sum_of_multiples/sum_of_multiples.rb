# Problem
# Given a number, and a set of numbers, find all the multiples of the numbers of the set, up to but not including the given number


# input -> a single integer, and optional set of 2+  numbers
# output -> an integer

# rules
# if no set is given, use the set [3,5] to create multiples
# set can be greater than 3 numbers
# will need to instantiate a new object when passing a custom set 
# will need a class method
# will need an instance method

# needed 
#   one class - SumOfMultiples
#   one instance method - to
#   one class method - to 


# Data
# integers - input, output 
# array  - used for collection to track multiples, and to use numbers to sum 

# algorithm
#  initialize
#     if no args given the first two arguments will = 3 , 5
#     add functionality for addtl option ivars
#     ivar nums is an array of all args
# class to
#   instantialte a new SumOfMultiples object
#   call instance method  to_i
# instance to 
#   for each of the numbers in the nums ivar, iterate and return all the multiples of the method
#    - Sub find multiples - input the number in the set being iterated on, and the max number to iterate to
#         - init an empty arr for results
#         - init a variable multiple set to 1
#         - init a product value set to nil
#         - loop until the value of product is greater than  max number
#         - append the product to the  number times the multiple.
#   flatten the return
#   dispose of uniqe values
#   sum the values



class SumOfMultiples
  attr_reader :nums

  def initialize(num1=3, num2=5, *addtl_nums)
   @nums = [num1, num2, addtl_nums].flatten
  end

  def self.to(num)
    sets = SumOfMultiples.new
    sets.to(num)
  end

  def to(max)
    nums.map { |i| find_multiples(i, max) }.flatten.uniq.sum
  end 

  def find_multiples(num, max)
    multiples = []
    multiple = 1
    product = nil
    loop do 
      product = num * multiple
      break if product >= max
      multiples << product
      multiple += 1
    end 
    multiples
  end
end
