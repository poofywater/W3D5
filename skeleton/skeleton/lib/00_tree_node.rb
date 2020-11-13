class PolyTreeNode

    attr_reader :parent, :value, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end 

    def parent=(new_parent)
        # remove self from parents children?
        # if @parent != nil

        @parent.children.delete(self) if @parent != nil
        @parent = new_parent
        @parent.children << self if @parent != nil
        # add self to @parent.children
    
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if !@children.include?(child)
            raise "not a child"
        else
        child.parent = nil 
        end
    end

    def inspect
        @value.inspect
    end

    def dfs(target_value)
        return nil if self == nil
        return self if self.value == target_value

        @children.each do |child|
            result = child.dfs(target_value)
            return result unless result == nil
        end

        return nil
    end

    def bfs(target_value)
        queue = []
        queue << self

        while !queue.empty?
            pficb = queue.shift
            return pficb if pficb.value == target_value
            
            pficb.children.each do |child|
                queue << child
            end
        end

    end

end

