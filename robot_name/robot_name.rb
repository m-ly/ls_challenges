# Class Robot
#  Class Methods - N/A
#  Instance Methods
#    # name - input -> n/a  -- output -> 2 random uppercase letters and 3 random digits
#
#    # reset - input -> n/a -- output -> a new robot name

# rules
#  if robot name is duplicate of another, it should be set to a new name -- (save taken names to class varaible )

# data 
# strings - collection which contains name data
# array - holds names which have been assigned

# algorithm
# when a robot object is instantiated a name should be generated
# SUB 1 - generate a name
#  -- if a name is taken, force the generate function to loop until a unused name is generated
#      to generate a name 
#       -- select 2 random letters and concatenate to a results string
#       -- select 3 random numbers, convert to a string, and concatenate to a results string
#     -- once the name is generated, append to a class variable os taken names
# Reset a name 
#   -- assign the ivar holding the name to nil
#   -- Generate a new name

# Names a robot upon instantiation. Naming protocol avoids collisions between names
class Robot
  attr_reader :name

  @@taken_names = []

  def initialize
    @name = generate_new_name
  end

  def reset
    self.name = nil
    generate_new_name
  end

  private 

  attr_writer :name

  def generate_new_name
    full_name = ''
    loop do
      2.times { full_name << ('A'..'Z').to_a.sample }
      3.times { full_name << (0..9).to_a.sample.to_s }
      break unless @@taken_names.include?(full_name)
    end
    @@taken_names << full_name
    self.name = full_name
  end
end
