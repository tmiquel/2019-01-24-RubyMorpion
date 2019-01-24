#! usr/bin/env ruby
# frozen_string_literal: true

require_relative 'box'

class Board
  attr_reader :boxes_array

  def initialize
    line_count = 1 # les positions iront de [1,1] à [3,3]
    column_count = 1
    @boxes_array = [[Box.new([1, 1], :none), Box.new([1, 2], :none), Box.new([1, 3], :none)],
                    [Box.new([2, 1], :none), Box.new([2, 2], :none), Box.new([2, 3], :none)],
                    [Box.new([3, 1], :none), Box.new([3, 2], :none), Box.new([3, 3], :none)]]
  end

  def tick_box(box_position, player)
    box = get_box_by_position(box_position)
    box.ticked_by_player = player
    box.ticked = true
  end

  def get_box_by_position(box_position_array)
    @boxes_array[box_position_array[0] - 1][box_position_array[1] - 1]
  end
end
