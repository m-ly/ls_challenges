# Needed Class 
#    - RomanNumeral
# Needed Methods 
#    - Initialize 
#       args - integer -> set as ivar
#    - to_roman 
#       converts ivar to string


# Problem 
#   Given an interger return a string of the roman numeral equivalent of the number

# rules
#   There is no symbol for 0
#   4 and 9s are special cases. 


# data 
# hash: to model integer value and string relationship
# integer - used as key in hash
# string - used as value for has

        # I=1
        # IV=4
        # V=5
        # IX=9
        # X=10
        # XL=40
        # L=50
        # XC=90
        # C=100
        # CD=400
        # D=500
        # CM=900
        # M=1000

# approach 
# Greedy match!  Largest value to smallest value
# Create a hash containing all the values used to construct roman numberals
# Create a new string to hold results
# Create a new variable remainder -- set to value of the passed argument
# 
# While the integer variable is greater than 0 -> 
#   iterate the hash from greatest value to smallest value
#   if the value of the numeral can be subtracted from the given number 
#      subtract the hash value from remainder
#      append the key for the hash to results
#      return to begining of hash loop
# return the results string


class RomanNumeral
  ROMANS = {'M'=>1000, 'CM'=>900, 'D'=>500, 'CD'=>400, 'C'=>100, 'XC'=>90,  
            'L'=>50,'XL'=>40, 'X'=>10, 'IX'=>9, 'V'=>5, 'IV'=>4, 'I'=>1}

  def initialize(num)
    @num = num
  end 

  def to_roman
     results = ''
     remainder = @num

     until remainder == 0
       ROMANS.each do |sym, val|
         if val <= remainder 
           remainder -= val
           results << sym
           redo
         end
       end
     end 
     results
  end
end