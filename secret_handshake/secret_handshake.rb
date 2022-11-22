# frozen_string_literal: true

# Class - Secret Handshake
#   class methods
#   instance methods
#      - initialize - input: an integer, or a string representation of an integer
#      - commands - input: uses integer passed from ivar : output: an array of strings

# rules
# if the value is 0 and empty array is returned
# invalid binary strings are assigned the value of 0
# From a given integer value the collection is greedy
# will always need to convert given number to binary, if it's not already a binary number
#    ex: 9 -->   1 ==> binary returns wink  8 --> not binary, binary equivalent is 1000, returns jump
#     -- ['wink', 'jump']
# if an entry from the  handshake type constant is used it should be dropped from the list
# Integer# or String to_(2) --> converts to base 2, save to a new variable

# data
# integer - given to initialize handshake object
# hash to convert integer to string values
# array - for return of commands
# string - populates array
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = Reverse the order of the operations in the secret handshake.

# algorithm
# initialize
# sets ivar input -- input  is a string or integer
# - if input is a string, convert the input to an integer

# subtract the largest binary number from the total that is possible w/o returning a negative number

#   sub1 - determine if a number is binary
#     a number is binary if it is comprised of only 0s and 1s

# if the number is not binary convert to binary form
# once the number has been converted, iterate loop, subtracting the largest value possible,
# and adding element to the results list until input is 0

# if at any time the number is > 10000
#   sub2 - reverse_order
#     create an instance variable `reversed`, with an initial value of false
#     if reverse order is called, it changes the state of reverse order to opposite of it's current state
# - subtract 10000 from input

#   sub3 - add_to_list
#     if reversed is true -- append to list
#     if reversed is false -- prepend to end of list

#  if there is a binary number that can be subtracted, shift/append the string value to a results list
#  else convert to binary

#  for each iteration - substract hash key from input value

# A class representing a code that models a relationship between a binary number, and a group of actions.
class SecretHandshake
  attr_accessor :input, :reversed

  TYPES = { 1000 => 'jump', 100 => 'close your eyes', 10 => 'double blink', 1 => 'wink' }.freeze

  def initialize(input)
    @input = convert_binary(input)
    @reversed = false
  end

  def commands
    results = []

    until input.zero?
      if input > 10_000
        reverse
        self.input -= 10_000
      else
        iter_keys(results)
      end
    end
    results
  end

  def convert_binary(num)
    num.to_i.to_s(2).to_i
  end

  def reverse
    @reversed == false ? @reversed = true : @reverse = false
  end

  def add_element(obj, element)
    if @reversed
      obj.append(element)
    else
      obj.unshift(element)
    end
    obj
  end

  def iter_keys(obj)
    TYPES.each_key do |num|
      if num <= input
        add_element(obj, TYPES[num])
        self.input -= num
      end
    end
    obj
  end
end
