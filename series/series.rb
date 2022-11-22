# frozen_string_literal: true

# Class - Series
# instance methods
# 1 initialize
# input - a string
# ivar - string converted to arra
# 2 - slices
# input - int(n)
# output - arr of n len sebarrays
# raise ArgumentError if slice is greater than the size of the array

# A class that allows for a string object to be split into a an array containing a subarray of integers
class Series
  def initialize(str_num)
    @chars_arr = str_num.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError, 'Slice needs to be less than or equal to string size' if slice_size > chars_arr.size

    results = []
    chars_arr.each_cons(slice_size) { |slice| results << slice }
    results
  end

  private

  attr_reader :chars_arr
end
