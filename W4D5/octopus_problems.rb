fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', '
              fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up" ]     
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
               
def quadratic_search(fish)
    fish.each_with_index do |fish_1, idx_1|
        max_length = true
        fish.each_with_index do |fish_2, idx_2|
            next if idx_1 == idx_2
            max_length = false if fish_2.length > fish_1.length
        end
    end
    return fish_1 if max_length
end

def merge_sort(arr, &prc)
    return arr if arr.length <= 1
    prc ||= Proc.new { |a, b| a <=> b }

    mid = arr.length/2
    merged_left = merge_sort(arr.take(mid), &prc)
    merged_right = merge_sort(arr.drop(mid), &prc)

    merge(merged_left, merged_right, &prc)
end

def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
            merged << left.shift
        when 0
            merged << left.shift
        when 1
            merged << right.shift
        end
    end
    merged.concat(left)
    merged.concat(right)

    merged
end

def nlogn(fish)
    prc = Proc.new{|x, y| y.length <=> x.length}
    merge_sort(fish, &prc)[0]
end

def linear(fishes)
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end
  biggest_fish
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end