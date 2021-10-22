class Queue
    def initialize
        @queue_array = []
    end

    def queue_array
        @queue_array
    end

    def enqueue(ele)
        @queue_array.push(ele)
        ele
    end

    def dequeue
        @queue_array.shift
    end

    def peek
        @queue_array[0]
    end


end