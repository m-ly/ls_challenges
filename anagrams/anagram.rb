# Problem - Write a program that takes a string, and a list of strings, and returns a sublist of all words in the given string that are anagrams of the given word

# input -> a string, a list of strings
# output -> A list of strings which are anagrams of the single input string

# Rules 
# Define anagrams for this case
#    - they are case insensitive
#    - if there is an identical word it is not an anagram

# Needed Classes 
#   Anagram
     # Methods
      # initialize -> 
      # match -> match is a selection method and returns any string in the list that is an anagram of the comparison string
      #   -> takes a list as an argument 
      # is_anagram -> Returns true if a string is an anagram of another
      #   -> takes two strings as an argument 


# Data 
#  string
#  Array 

# Algorithm
#  # instantiate a new object
#    - ivar: base_word = string
# sub1: match
#  # Iterate through the given list
#  sub2: is duplicate? (input -> a list, word,  output -> a list)
#   # if the current word is a case insensitve exact match of the base word, it is not an anagram

# sub3: is_anagram? (input -> string )
#  #  split and sort the base word
#  #  split and sort the argument
#  #  returns true if base_word, and sorted arg contain the same elements

class Anagram
  def initialize(word)
    @base_word = word
  end 

  def match(list)
    list = remove_duplicate(list)
    list.select { |word| is_anagram?(word)}
  end

  private

  def remove_duplicate(list)
    list.select { |word| word.downcase != @base_word.downcase }
  end

  def is_anagram?(word)
    word.downcase.chars.sort == @base_word.downcase.chars.sort
  end
end