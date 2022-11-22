# Problem 
#By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^   - 7 is the hamming distance

# Input
# -> a string
# -> an integer 

# Rules
# The hamming difference is only counted for sequences of the same length - if there are 2 different length sequences, then the comparison should be made for sequences of shorter length. 
# do not mutate the original strand passed as an argument. 

# Data
# strings
# integers


# DNA class / Object
#    #1. Create a DNA object -- with sequence ivar (str)
#    #2  Define a hamming_difference method 
#      initialize a variable count set equal to 0 
  #    #1 determine the max size of the string 
  #         -- max size = size of shortest string value
  # once the strings are the same len, compare for equality of values
  #    #2 iterate from 0 up to the max index of the shortes string,  and if the value at obj1[idx] is different than the index at obj2[idx] add a number to the count
  #    - hamming_distance method -> returns integer which is the difference between the sequences 


# Algorithm

class DNA
  attr_accessor :strand

  def initialize(strand)
    @strand = strand
  end 

  def hamming_distance(distance)
    count = 0 
    max_len = [strand.size, distance.size].min

    (0...max_len).each do |idx|
      count += 1 if strand[idx] != distance[idx]
    end
    count
  end
end