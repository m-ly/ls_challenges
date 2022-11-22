# frozen_string_literal: true

# problem - recode the 99 bottles of beer song to itereate from 99 to 0

# Class : BeerSong
#   class method: verse

# data
#  - string
#  - integer -- used as a class variable

# algorithm
#  class var num_bottles ==
# from 99 down to 0 iterate the number
#    if the number is > 1 return general verse passing the

# A song about beer, in OOP structure
class BeerSong
  # rubocop:disable Metrics/MethodLength
  def self.verse(bottles)
    bottles_less_one = bottles - 1
    if bottles > 2
      "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{bottles_less_one} bottles of beer on the wall.\n"
    elsif bottles == 2
      "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{bottles_less_one} bottle of beer on the wall.\n"
    elsif bottles == 1
      "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
  # rubocop:enable Metrics/MethodLength

  def self.verses(*bottles)
    bottle_range = (bottles[1]..bottles[0]).to_a.reverse
    bottle_range.map do |bottle_num|
      verse(bottle_num)
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
