class LRUCache
  def initialize(max_size)
    @my_cache = []
    @count = 0
    @my_hash_size
  end

  def count
    # returns number of elements currently in cache
    @count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @my_cache.include?(el)
      @my_cache.delete(el)
      @count -= 1
    end
    if count == 4
      @my_cache.shift
      @count -= 1
    end
    @my_cache.push(el)
    @count += 1
  end

  def show
    # shows the items in the cache, with the LRU item first
    @my_cache.to_s
  end

  private
  # helper methods go here!

end


johnny_cache = LRUCache.new(4)

 johnny_cache.add("I walk the line")
 johnny_cache.add(5)

 p johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
 johnny_cache.add(-5)
 johnny_cache.add({a: 1, b: 2, c: 3})
 johnny_cache.add([1,2,3,4])
 johnny_cache.add("I walk the line")
 johnny_cache.add(:ring_of_fire)
 johnny_cache.add("I walk the line")
 johnny_cache.add({a: 1, b: 2, c: 3})

 p johnny_cache.count # => returns 4

p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
