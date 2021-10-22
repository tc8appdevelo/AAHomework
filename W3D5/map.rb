class Map
    def initialize
        @map_array = []
    end

    def map_array
        @map_array
    end

    # check if key exists, if it does
    # update the key, value pair.  If it doesnt exist,
    # make a new key, value pair.
    def set(key, value)
        key_value_index = nil
        @map_array.each_with_index do |arr, idx|
            if arr[0] == key
                key_value_index = idx
            end
        end
        # if it doesnt exist
        if key_value_index == nil
            @map_array.push([key, value])
        else # if it does exist change it
            map_array[key_value_index][1] = value
        end
        value
    end

    # get value that key is associated with
    # return nil if it doesnt exist.
    def get(key)
        @map_array.each do |arr|
            if arr[0] == key
                return arr[1]
            end
        end
        nil
    end

    def delete(key)
        value = get(key)
        @map_array.reject! { |arr| arr[0] == key }
        value
    end

    def show
        @map_array.map { |arr| arr }
    end



end