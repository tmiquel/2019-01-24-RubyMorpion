#! usr/bin/env ruby
# frozen_string_literal: true

class Player
  attr_reader :name_str, :is_first, :color_sym

  def initialize(
    first_bool, player_name_str
  )
    @is_first = first_bool
    @name_str = player_name_str
    @color_sym = @is_first ? :blue : :red
  end
end
