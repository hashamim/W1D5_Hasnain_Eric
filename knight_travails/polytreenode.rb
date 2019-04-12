require_relative "knightpathfinder"
require 'byebug'

class PolyTreeNode
    attr_reader :parent
    def initialize(value, parent = nil)
        @value = value
        @parent = parent
        @children = []
        if parent
            parent.children << self
        end
    end
end