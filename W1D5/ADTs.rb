class Stack
  attr_reader :stack

  def initialize(el = nil)
    el ? (@stack = [el]) : (@stack = [])
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    stack.dup
  end
end

class Queue
  attr_reader :queue

  def initialize(el = nil)
    el ? (@queue = [el]) : (@queue = [])
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    queue.dup
  end
end

class Map

  attr_reader :map
  def initialize(k = nil, v = nil)
    k.nil? || v.nil? ? @map = [] : @map = [[k, v]]
  end

  def assign(k, v)
    pos = find_key_value_index(k, v)
    puts pos.to_s
    pos.nil? ? @map.push([k, v]) : @map[pos] = [k, v]
  end

  def lookup(k)
    map.select { |key, _| k == key }[1]
  end

  def remove(k)
    @map.reject! { |key, _| k == key }
  end

  def show
    map.select { |_, _| true }
  end

  private

  def find_key_value_index(k, _)
    pos = nil
    map.each_with_index { |pairs, idx| pos = idx if pairs[0] == k }
    pos
  end

end
