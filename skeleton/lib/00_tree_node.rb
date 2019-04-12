require "byebug"
class PolyTreeNode
    attr_reader :parent, :value, :children
    def initialize(value)
        @parent = nil
        @value = value
        @children = []
    end
    def parent=(ma) 
        if parent
            child_arr = self.parent.children
            child_idx = child_arr.index(self)

            child_arr.delete_at(child_idx)
        end
        @parent = ma
        self.parent.children << self if ma

 
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        exception unless children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        retrieve_target = nil

        @children.each do |child|
            retrieve_target ||= child.dfs(target_value)
        end
        retrieve_target
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            return queue[0] if queue[0].value == target_value
            queue[0].children.each{|child| queue.push(child)}
            queue.shift
        end
        nil
    end
    
    

    # def inspect
    #     # { 'value' => @value, 'parent_value' => @parent}.inspect
    # end

end
