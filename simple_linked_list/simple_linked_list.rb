# class Element
#   instance method
#     - initialize - takes integer input, and option next value
#     - datum -- returns integer
#     - tail? -- returns true if a value exists
#     - next -- is nil as default -- returns element object if there is a value
#     - to_a -- returns the list_data (the collection will need to be reversed)
#     - reverse --
# class SimpleLinkedList
#     - instance methods
#       - initialize - creates an ivar that tracks an array
#       - size  - returns size of array
#       - empty - returns true if ivar tracking list is empty
#       - push - input: integer -- pushes an element to the end of a list
#       - peek - return nil if the list is empty, otherwise, return the head of last element of the list.
#       - head - returns data of last element in the array
#       - pop -  returns the value of
#       - to_a - input: linked list output: an array object
#     - class methods
#       - from_a - input: list of integers, output: a linked list object

class Element
  attr_accessor :head, :next

  def initialize(element, trailing = nil)
    @head = element
    @next = trailing
  end

  def datum
    @head
  end

  def tail?
    @trailing.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(data)
    @list <<  Element.new(data)
    head.next = @list[-2] if @list.size > 1
  end

  def peek
    return nil if @list.empty?

    @list.last.datum
  end

  def head
    @list.last
  end

  def pop
    @list.pop.datum
  end

  def to_a
    @list.reverse.map(&:head)
  end

  def self.from_a(collection)
    return SimpleLinkedList.new if collection.nil?

    list = SimpleLinkedList.new
    collection.reverse.each do |datum|
      list.push(datum)
    end

    list
  end

  def reverse
    reversed = SimpleLinkedList.new
    @list.reverse.each do |ele|
      reversed.push(ele.head)
    end
    reversed
  end
end
