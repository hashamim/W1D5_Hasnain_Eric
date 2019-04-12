require 'byebug'
require_relative 'polytreenode'
require_relative "queue"
#self.root_node
class KnightPathFinder
    attr_reader :root_node, :considered_positions, :queue

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = Hash.new {|h,k| h[k] = false}
        @queue = Queue.new
        build_move_tree(self.root_node)
    end

    def build_move_tree
        new_move_positions(root_node).each do |move|
            PolyTreeNode.new([move])
        end
    end

    def find_path

    end

    def self.valid_moves(start)
        valid_array = []
        (0...8).each do |x|
            (0...8).each do |y|
                valid_array << [x,y] if valid_move?(start,[x,y])
            end
        end
        valid_array
    end

    def self.valid_move?(start,finish)
        x_start, y_start = start
        x_finish, y_finish = finish
        x_diff = (x_finish - x_start).abs
        y_diff = (y_finish - y_start).abs
        if x_diff == 2 && y_diff == 1
            true
        elsif x_diff == 1 && y_diff == 2
            true
        else
            false
        end
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)

        next_moves = possible_moves.reject {|move| considered_positions[move]}

        next_moves.each {|move| considered_positions[move] = true}
    end
end