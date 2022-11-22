# rules - last in, first out

# list structure [ head [next]] --> [ head [next]]
# where the current next is the head of the next object 

class Element
  attr_reader :datum, :next

  def initialize(element, element2=nil)
    @datum = element
    @next = element2
  end 
    
  def tail?
    @element2 == nil
  end 
end 

class SimpleLinkedList
  @@next = nil 

  def initialize
    @list = []
  end 

  def size 
    @list.size
  end 

  def empty?
    @list.empty?
  end

  def push(ele)
    ele = Element.new(ele)
    @list << ele
  end
  
  def pop
    @list.pop.datum
  end

  def peek
    return nil if @list.empty?
    head.datum
  end

  def head
    last_ele = @list.size - 1
    @list[last_ele]
  end 

  def self.from_a(obj)
    list = SimpleLinkedList.new 
    obj.each do |ele|
      p list.push(Element.new(ele).datum)
    end
    list
  end
end








