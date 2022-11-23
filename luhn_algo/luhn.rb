# frozen_string_literal: true

# Class - Luhn
#   class methods
#     - create - input: integer, output: an integer
#       - takes an integer, and outputs a valid luhn number, by adding an extra digit at the end of the input
#   instance methods
#     - initialize - input: integer
#     - addends - returns an array
#     - checksum - returns an integer
#     - valid? - returns a boolean

# This is a checksum algorithm
# For a given number, iterate right to left
#   if for every second digit
#     double the number
#      - if the doubled number is greater than 10, substract 9
#      - return each number to a new array
#  - sum the numbers of the array
#    - if the last number of the sum is == 0 return true

# rules
# skip spaces
# input is only integers

# data
# integers - input
# array = used for collections

# Algorithm
# addends
# reverse the numbers and convert to an array
# iterate the new array,
#  if the index is even double the number at that index
#  if the product is greater than 10, return product - 9
#  else return the number
# reverse the array again

# create
#  initialize a new luhn object
#  from the number of 0-9 iterate a range, prepending the number to the reversed digits array
#  for each iteration, check if the checksum is valid?
#  if it is break and convert the number to an integer
#  reverse the number back to it's proper order

# Checksum formula to determine if a givennumber is a valid Luhn number
class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    result = []
    all_digits = @number.digits
    (0...all_digits.size).each do |idx|
      result << if idx.odd?
                  double_value(all_digits, idx)
                else
                  all_digits[idx]
                end
    end
    result.reverse
  end

  def double_value(arr, idx)
    val = arr[idx] * 2
    normalized_val(val)
  end

  def normalized_val(num)
    num > 10 ? num - 9 : num
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum.digits.first.zero?
  end

  def self.create(num)
    10.times do |addtl_num|
      modified_num = num.digits.unshift(addtl_num).join.reverse.to_i
      tmp = Luhn.new(modified_num)
      return modified_num if tmp.valid?
    end
  end
end
