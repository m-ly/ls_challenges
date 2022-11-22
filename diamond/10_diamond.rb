# frozen_string_literal: true

# Class - Diamond
#   class methods
#     - make diamond
#   instance methods - nil

# make diamond
#  input -  is a letter
#  output - a diamond made from the letters

# rules
# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# need to track max width
# starting character spaces
# ending character spaces

# data
# string - input and characters printed out
# array - used for iterating string characters for the output

# algorithm
# if the input is 'A', only 'A' is printed
# Else
# create a range from A upto input letter, and convert to an array
# Find the max width of the diamond
#   -- width starts at one - no space between chars
#   -- next line width is 3 - one space between chars
#   -- for every subsequent row space betwen chars is += 2 from the previous ( 1 -> 3 -> 5 -> 7)
# Center the text

# Creates a string representation of a diamond constructed with letters as the borders
class Diamond
  def self.make_diamond(input_letter)
    results = []
    letters = ('A'..input_letter).to_a
    reversed_letters = letters[0...-1].reverse
    max_width = letters.size * 2 - 1
    space = 1

    letters.each do |letter, _idx|
      case letter
      when 'A'
        results << 'A'.center(max_width)
      when 'B'
        results << 'B B'.center(max_width)
      else
        space += 2
        str = letter + ' ' * space + letter
        results << str.center(max_width)
      end
    end

    reversed_letters.each do |letter|
      case letter
      when 'A'
        results << 'A'.center(max_width)
      when 'B'
        results << 'B B'.center(max_width)
      else
        space -= 2
        str = letter + ' ' * space + letter
        results << str.center(max_width)
      end
    end

    "#{results.join("\n")}\n"
  end

  def top_half(letters)
  end
end
