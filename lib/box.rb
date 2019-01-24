#! usr/env/bin ruby
# frozen_string_literal: true

class Box
  attr_accessor :ticked_by_player, :ticked
  attr_reader :position_array

  def initialize(position, ticked_by_player = :none)
    @position_array = position
    @ticked_by_player = ticked_by_player
    @ticked = false
    end
end
