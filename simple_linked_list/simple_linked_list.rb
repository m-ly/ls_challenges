class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, nxt=nil)
    @datum = datum
    @next = nxt
  end

  def tail?
    @next == nil
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

  def push(value)
    val1 = Element.new(value)

    if @list.empty?
      @list.push(val1)
    else 
      @list[-1].next = val1 
      @list.unshift(val1)
    end
  end

  def peek
    return nil if @list.empty?
    @list.last.datum
  end

  def head
    @list[0]
  end

  def [](idx)
    @list[idx]
  end

 
end