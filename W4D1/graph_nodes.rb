require 'set'

class GraphNode
    attr_accessor :val, :neighbors
    def initialize(val)
        @val = val
        @neighbors = []
    end

    def add_neighbor(node)
        @neighbors << node
    end

end

# p a = GraphNode.new('a')
# p b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# p a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]

def bfs(starting_node, target_value)

    queue = [starting_node]
    visited = Set.new()

    while !queue.empty?
        node = queue.shift
        if !visited.include?(node)
            return node.val if node.val == target_value
            visited.add(node)
            queue += node.neighbors
        end
    end

    nil
end

# p bfs(a, "b")
# p bfs(a, "f")