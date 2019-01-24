#! usr/bin/env ruby
# frozen_string_literal: true

require_relative 'game'

class GameTurn
  attr_reader :first_player, :second_player, :board, :game

  def initialize(
    first_player, second_player, board, game
  )
    @first_player = first_player
    @second_player = second_player
    @board = board
    @game = game
  end

  def play
    game_status = play_per_player(@first_player)
    if game_status[0] == 'keep playing'.to_sym
      game_status = play_per_player(@second_player)
    end
    game_status
  end

  def play_per_player(player)
    @game.pick_a_box(player)
    return [:won, player] if game_is_won_by?(player)
    return [:drawn, player] if game_is_drawn?
    ['keep playing'.to_sym, player]
  end

  def game_is_won_by?(player)
    (full_line_crossed?(player) ||
     full_column_crossed?(player) ||
     diagonal_crossed?(player))
  end

  def full_line_crossed?(player)
    lines_checked?(@board.boxes_array, player)
  end

  def full_column_crossed?(player)
    transposed_line_0 = []
    transposed_line_1 = []
    transposed_line_2 = []

    @board.boxes_array.each do |line|
      transposed_line_0 << line[0]
      transposed_line_1 << line[1]
      transposed_line_2 << line[2]
    end

    transposed_boxes_array = [transposed_line_0, transposed_line_1, transposed_line_2]
    lines_checked?(transposed_boxes_array, player)
  end

  def diagonal_crossed?(player)
    a = @board.boxes_array
    diagonal_1_array_of_boxes = [a[0][0], a[1][1], a[2][2]]
    diagonal_2_array_of_boxes = [a[0][2], a[1][1], a[2][0]]
    lines_checked?([diagonal_1_array_of_boxes, diagonal_2_array_of_boxes], player)
  end

  def lines_checked?(array_of_box_lines, player)
    checked_lines_bool_array = array_of_box_lines.collect do |boxes_line_array|
      (boxes_line_array[0].ticked_by_player == player) &&
        (boxes_line_array[1].ticked_by_player == player) &&
        (boxes_line_array[2].ticked_by_player == player)
    end
    (checked_lines_bool_array[0] || checked_lines_bool_array[1] || checked_lines_bool_array[2])
  end

  def game_is_drawn?
    is_drawn = true
    @board.boxes_array.each do |boxes_line_array|
      boxes_line_array.each do |box|
        is_drawn = false if box.ticked == false
      end
    end
    is_drawn
  end
end
