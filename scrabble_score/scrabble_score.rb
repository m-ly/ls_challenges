# Given a word, utilize the prescribed values to determine what the score of the word would be in scrabble

# input -> a string
# output -> an integer

# Classes 
#  Scrabble
#    #Methods
#      # initialize (input is a string)
#          ivar: word => string
#      # score -> takes a string as an input returs an integer

# Rules


# Data
# Hash -- Stores string letters (for matches as values, integer is the key)
# Array -- for value of the hash, convert input words to array of letters
# String -- input is a string, values in array of hash are string letters
# Integer  -- Return of score function, key value of the hash


# Algorithm 
# initialize a results array
# Upcase the input string and split it into chars
# for each character
  # Iterate the scrabble keys, 
   # if the values of the key contains the current character
    #   return the key to the result array
# sum the results array



SCORE_TABLE = { 1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'], 
                2 => ['D', 'G' ],
                3 => ['B', 'C', 'M', 'P'],
                4 => ['F', 'H', 'V', 'W', 'Y'],
                5 => ['K'], 
                8 => ['J', 'X' ],
                10 => ['Q', 'Z'] }


class Scrabble
  def initialize(word)
    @word = word
    @score = 0 
  end

  def score
    return 0 if @word == nil

    results = []
    chars = @word.strip.upcase.chars

    chars.each do |char|
      SCORE_TABLE.each do |score, _letter|
        if SCORE_TABLE[score].include?(char)
          results << score 
        end
      end 
    end

    results.sum
  end

  def self.score(word)
    word = Scrabble.new(word).score
  end 

  attr_reader :word
end





