class Stack
    def initialize
        @stack_array = []
    end

    def push(ele)
        @stack_array.push(ele)
        ele
    end

    def pop
        @stack_array.pop
    end

    def peek
        @stack_array[-1]
    end

    def stack_array
        @stack_array
    end

end