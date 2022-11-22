

# problem: Write a program to determine whether a triangle is equilateral, isosceles, or scalene.
# rules 
  # For a shape to be a triangle at all, all sides must be of length > 0, 
  # The sum of the lengths of any two sides must be greater than the length of the third side.
  # An equilateral triangle has all three sides the same length.
  # An isosceles triangle has exactly two sides of the same length.
  # A scalene triangle has all sides of different lengths.

  # data
  #  sides are measured in integer or float values
  #  an aray is a collection that can be used for all sides, allowing for comparison methods

  # approach/algorithm
  #  From tests, there needs to be a triangle class
  #     When a triangle object is instantiated, it should track 3 sides
  #        - since were just tracking and comparing numbers, and array is a functional collection device to use
  #        
  #        - Determine whether or not the arguments to instantiate a triangle object are valid - if they are not return an ARGUMENTERROR
  #            - if any of the objects are 0 - false
  #            - if the sum of the lens of the 2 shortest sides are less than the longest side - return false

  #   From tests, there is an instance method kind, which returns a string 
  #  
  #        - if all the sides given on initialization are equal return equalateral
  #        - if tow of the sides are the same 

class Triangle
  attr_reader :sides

  def initialize(s1,s2,s3)
    @sides = [s1, s2, s3].sort
    raise ArgumentError.new "Invalid Triangle" if !valid_triangle?
  end

  def kind
    return 'equilateral' if sides.all?(sides[0])
    return 'isosceles' if @sides.tally.values.any?(2)
    'scalene'
  end

  def valid_triangle?
    return false if sides.any? { |side| side <= 0 }
    return false if sides[0] + sides[1] <= sides[2]
    true
  end 
end