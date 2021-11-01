class LRUCache
    def initialize(size)
        @size = size
        @cache = cache
    end

    def count
        @cache.count
    end

    def add(ele)
        if @cache.include?(ele)
            @cache.delete(ele)
            @cache << ele
        elsif @cache.count >= @size
            @cache.shift
            @cach << ele
        else
            @cache << ele
        end
    end

    def show
        p @cache
    end

    private
    # helper methods

end