#class CircularBuffer
#  instance methods
#    - initialize  - input is an integer which sets ivar of buffer size
#    - read - input: ivar output: removes oldes value from the buffer
#    - write - input: string
#    - write! - overrides fullbuffer and removes oldest, writing a new value
#    - clear - returns a new empty buffer
 
# subclass
#   BufferEmptyException - for error handling, if a buffer is empty, this exception should be thrown
#     - this is namespaced from CircularBuffer::BufferEmptyException
#       - does this mean that our custom buffer class is a subclass of StandardError?



# rules
# if a buffer is empty a custom exception is raised
# write can start anywhere in the buffer, but for our usage, we will start at idx 0
# if a buffer has all spaces full, the oldest element will be overwritten
# if an element is overwritten with a string value, when the next write happens
# if nil is written, it does not count as buffer space, and the next element will be written at the same location that nil is written on


# data 
#  array object

# algorithm
# create an array that has n number of spaces that are available.    
# if the index is greater than that number, the first element in the array should be dropped to make room for the new element



class CircularBuffer
  def initialize(size)
    @buffer = []
    @size = size
  end
 
  def read
    @buffer.empty? ? raise(BufferEmptyException) : @buffer.shift
  end

  def write(value)
    return if value.nil?
    buffer_full? ? raise(BufferFullException) : @buffer << value
  end

  def write!(value)
    return if value.nil?
    self.read if buffer_full?
    self.write(value)
  end 

  def clear 
    @buffer = []
  end

  def buffer_full?
    @buffer.size == @size
  end 
  

  class BufferFullException < StandardError; end
  class BufferEmptyException < StandardError; end
end

