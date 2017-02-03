
def sluggish_octpus(arr)
  longest = ""
  arr.each do |fish_1|
    arr.each do |fish_2|
      longest = (fish_2.length < fish_1.length ? fish_1 : fish_2)
    end
  end
  longest
end


p sluggish_octpus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh','fiiiissshhhhhh'])

def dominant_octpus(arr)
  merge_sort(arr)[0]
end

def merge_sort(arr)

  return arr if arr.length <= 1
  mid = arr.length / 2
  left, right = arr.take(mid), arr.drop(mid)
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  ret = []
  until left.empty? || right.empty?
    case right[0].length <=> left[0].length
    when -1
      ret << left.shift
    when 0
      ret << left.shift
    when 1
      ret << right.shift
    end
  end

  left.empty? ? ret += right : ret += left
  ret
end

p dominant_octpus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh','fiiiissshhhhhh'])

def clever_octpus(arr)
  longest = arr.pop
  arr.each do |fish|
    longest = fish if fish.length > longest.length
  end
  longest
end

p clever_octpus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh','fiiiissshhhhhh'])

def slow_dance(given_dir, tiles_array)
  tiles_array.each_with_index do |dir, idx|
    return idx if dir == given_dir
  end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p  slow_dance("up", tiles_array)

p slow_dance("right-down", tiles_array)


def conastant_dance(given_dir, tiles_hash)
  tiles_hash[given_dir]
end

tiles_hash = {"up" => 0, "right-up"=> 1, "right"=> 2, "right-down"=> 3, "down"=> 4,
              "left-down"=> 5, "left"=> 6,  "left-up"=> 7 }
p  slow_dance("up", tiles_array)

p slow_dance("right-down", tiles_array)
