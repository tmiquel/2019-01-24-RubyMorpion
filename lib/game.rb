#! usr/bin/env ruby
# frozen_string_literal: true

require_relative 'board'
require_relative 'view'
require_relative 'player'
require_relative 'game_turn'
require_relative 'router'

# Le controller, dans une vision MVC de l'architecture du jeu

class Game
  attr_accessor :board, :view
  attr_reader :first_player, :second_player

  def initialize(first_player_name, second_player_name)
    @first_player = Player.new(
      first = true, first_player_name
    )
    @second_player = Player.new(
      first = false, second_player_name
    )
    @board = Board.new
    @view = View.new(self)
    play
  end

  def play
    loop do
      game_turn_output = GameTurn.new(
        @first_player,
        @second_player, @board, self
      ).play
      case game_turn_output[0]
      when :won
        @view.won_view(game_turn_output[1])
        Router.perform if @view.start_again?
        break
      when :drawn
        @view.drawn_view
        Router.perform if @view.start_again?
        break
      end
    end
  end

  def pick_a_box(player)
    box_position = @view.pick_a_box(player)
    @board.tick_box(box_position, player)
  end

  def get_box_status(line_count, column_count)
    box = @board.get_box_by_position([line_count, column_count])
    box.ticked_by_player
  end

  def box_ticked?(box_position)
    the_box = @board.get_box_by_position(box_position)
    the_box.ticked
  end
end
