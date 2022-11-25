# class School
#  class methods
#  instance methods
#    = initialize - input: na --> creates ivar holding a hash
#    - to_h -> input: SchoolTest object , output: a hash with keys being integer grade, and values being a list of names
#    - grade -> input: an integer, output: a list of names
#    - add -> input: name (string), grade (integer) -> appends name to grade (if the key exists), othersiwse makes a new key/val pair

class School
  def initialize
    @school = {}
  end

  def to_h
    results = {}
    self.school = school.sort.to_h
    school.each do |grade, name|
      students = school[grade]
      results[grade] = students.sort
    end
    results
  end 

  def add(name, grade)
    
    if school.keys.include?(grade)
      school[grade] << name
    else
      self.school[grade] = [name]
    end
  end 

  def grade(grade_num)
    if school.keys.include?(grade_num)
      school[grade_num]
    else
      self.school[grade_num] = []
    end
  end

  attr_accessor :school
end