# Class CustomSet
#   instance methods
#     - initialize : input: optional collection : initialized ivar @set which is empty array
#     - empty? : returns true if @ set ivar unitialzied or empty
#     - contains: input: integer , output: true or false if the set contains one of the numbers
#     - subset?:  input: optional collection of numbers  output is a true/false dependent 
#                        on if the data is included as a subset of the original set
#           - an empty array is always a subset of a given array
#     - disjoint? -  input: optional collection on numbers output true/flase dependent on if all
#                    numbers can be appended in order to the given array  ie  1,2 -> 3, 4 completes set in order 1, 3 -> 4, 5 does not
#     - eql - input: set object, output - true if all elements in the argument are included in the caller 
  #               - numbers for both do not have to be in same order
  #               - only compares unique numbers (duplicates of same number are okay)
#     - add - pushes integer to end of set
#     - intersection - input: a set object,  output: a custom set with objects that are shared by both sets
#                 - if no elements are the same, an empty set object is returned
#                 - if either of the compared set objects are empty, and empty set object is returned
#     - difference - input: a set object, output: a set object with items that are not shared by either set object
#     - union -  input- a set object, output: a new set object with elements in both sets, filtered by uniq elements, sorted
# 

class CustomSet
  attr_reader :set

  def initialize(collection=[])
    @set = collection
  end

  def empty?
    @set.empty?
  end

  def contains?(ele)
    @set.include?(ele)
  end

  def subset?(subset)
    tmp_set = @set - subset.set
    return false if subset.empty? && @set.size > 0
    return true if subset.set.empty? || @set.empty?
    return true if tmp_set.empty?
    false
  end

  def disjoint?(subset)
    return true if subset.set.empty? || @set.empty?

    tmp_set = @set + subset.set
    min,max = tmp_set.min, tmp_set.max
    full_range = (min..max).to_a
    full_range == tmp_set
  end

  def eql?(subset)
    @set.all? { |ele| subset.set.include?(ele) } && subset.set.all? { |ele| @set.include?(ele) }
  end

  def ==(other)
    @set == other.set
  end

  def add(ele)
    return CustomSet.new(@set) if @set.include?(ele)
    
    tmp_set = @set << ele  
    CustomSet.new(tmp_set)
  end

  def intersection(collection)
    return CustomSet.new([]) if collection.set.empty? 

    result = []
      @set.each do |ele|
        result << ele if collection.set.include?(ele)
      end
    CustomSet.new(result)
  end

  def difference(collection)
    return CustomSet.new([]) if @set.empty? && collection.set.empty?
    return CustomSet.new([]) if @set.empty?
    return self if collection.set.empty?
  
    result = @set.select { |ele| !collection.set.include?(ele) }
    CustomSet.new(result)
  end


  def union(collection)
    return CustomSet.new([]) if @set.empty? && collection.set.empty?
    return collection if @set.empty?
    return self if collection.set.empty?

    result = (@set + collection.set).uniq.sort
    CustomSet.new(result)
  end
end