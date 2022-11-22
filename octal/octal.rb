# Problem
# convert a number from base 8 to base 10 

# input is a string 
# output  -> an integer

# Classes needed
#  Octal
    # method needed
       #to_decimal - takes an string
       # converst string to integer
          # converst integer from base 8 to base 10

# rules 
# to convert from base 8 to base 10 the following formula is used
    #1 if the number is < 10 --> return the number
    #2.if the number is > 10 -->   n = count of current number slice from right to left , k = base  = e = exponent  --> num_slice * 8 ^ n-1
# if there is a string letter value in the input --> input is invalid, invalid inputs return 0 
# values 2-7 are invalid imputs and return 0 
# any input with chars 8 or 9 are invalid and retuns 0 

# Data 
# string - input 
# integer - base 8 number slices, and base10 return
# array -  used to collect number slices and transform them 


# Algorithm
#  instantiate a new octal number
       # validate iput before assigning ivar
#      ivar = num to_i
#  call to_decimal on it
#  
#      # sub1 -(digits should work for this)
#       - split the number into characters
#       - reverse the characters
#      # sub2 
#       - iterate the array, tracking index
#       - transfrom the number using the formula: num * 8 ^ idx 
#    sum the array 
#       # sub 3 -  validate input 
#          if ivar contains a letter return 0 
#          if an ivar value is 8 or 9 return 0
#          return num converted to int

class Octal
  attr_reader :num

  def initialize(num)
    @num = validate_input(num)
  end

  def to_decimal
    base_8_coversion(num.digits).sum
  end 

  def base_8_coversion(digits)
    digits.map.with_index { |digit, idx| digit * 8 ** idx }
  end 

  def validate_input(num)
    return 0 if num.chars.any? { |char| char.match(/[a..zA..Z]/)}
    return 0 if num.to_i.digits.any? { |char| char == 8 || char == 9  } 
    num.to_i
  end
end 