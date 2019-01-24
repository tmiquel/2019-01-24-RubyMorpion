#! usr/bin/env ruby
# frozen_string_literal: true

require 'colorize'
require_relative 'game'
String.disable_colorization = false # enable colorization

class View
  attr_reader :game, :box_array, :box_string_to_position_hash
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3

  def initialize(game)
    @game = game
    @a1 = @a2 = @a3 = @b1 = @b2 = @b3 = @c1 = @c2 = @c3 =
                                                      get_print_string(:none)
    @box_array = [[@a1, @a2, @a3], [@b1, @b2, @b3], [@c1, @c2, @c3]]
    @box_string_to_position_hash =
      { a1: [1, 1], a2: [1, 2], a3: [1, 3],
        b1: [2, 1], b2: [2, 2], b3: [2, 3],
        c1: [3, 1], c2: [3, 2], c3: [3, 3] }
  end

  def pick_a_box(player)
    loop do
      puts "#{player.name_str} : C'est à ton tour !".colorize(player.color_sym)
      puts 'Coche une case!'.colorize(player.color_sym)
      print_board(@game.board)
      puts 'Quelle case veux-tu cocher?'.colorize(player.color_sym)
      print ' > '.colorize(player.color_sym)
      ticked_case_string = gets.chomp.downcase.strip
      puts '*' * 70
      # On break si la réponse est dans les clous et c'est une case libre
      next unless box_input_in_range?(ticked_case_string, player)
      box_position = @box_string_to_position_hash[ticked_case_string.to_sym]
      return box_position if box_ticked?(box_position) == false
    end
  end

  def print_board(_board)
    update_all_print_strings
    puts
    puts '   1   2   3'
    puts "A  #{@a1} " + '|'.green + " #{@a2} " + '|'.green + " #{@a3} "
    puts '  ---|---|---'.green
    puts "B  #{@b1} " + '|'.green + " #{@b2} " + '|'.green + " #{@b3} "
    puts '  ---|---|---'.green
    puts "C  #{@c1} " + '|'.green + " #{@c2} " + '|'.green + " #{@c3} "
    puts
  end

  def update_all_print_strings
    @a1 =  get_print_string(@game.get_box_status(1, 1))
    @a2 =  get_print_string(@game.get_box_status(1, 2))
    @a3 =  get_print_string(@game.get_box_status(1, 3))
    @b1 =  get_print_string(@game.get_box_status(2, 1))
    @b2 =  get_print_string(@game.get_box_status(2, 2))
    @b3 =  get_print_string(@game.get_box_status(2, 3))
    @c1 =  get_print_string(@game.get_box_status(3, 1))
    @c2 =  get_print_string(@game.get_box_status(3, 2))
    @c3 =  get_print_string(@game.get_box_status(3, 3))
  end

  def box_ticked?(box_position)
    is_ticked = @game.box_ticked?(box_position)
    if is_ticked
      puts
      puts 'Cette case est déjà cochée !!'
      puts
    end
    is_ticked
  end

  def box_input_in_range?(ticked_case_string, player)
    correct_answers = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]
    unless answer_ok = correct_answers.include?(ticked_case_string)
      puts
      puts 'Ton choix est hors clou mec!!'.upcase.colorize(player.color_sym)
      puts "Tu dois choisir 'a1', 'b2', ou 'c3'... etc tu piges?"
      print_start_again_choice(player)
    end
    answer_ok
  end

  def print_start_again_choice(player)
    puts "Tu recommences #{player.name_str}! ".upcase.colorize(player.color_sym)
    sleep(1)
    puts
  end

  def get_print_string(player_who_ticked)
    case player_who_ticked
    when :none
      ' '
    when @game.first_player
      'X'.colorize(@game.first_player.color_sym)
    when @game.second_player
      '0'.colorize(@game.second_player.color_sym)
    else
      'Cas imprévu dans get_print_string'
    end
  end

  def won_view(winning_player)
    puts
    puts '='.yellow.blink * 70
    puts ' ' * 10 + "FELICITATIONS !! #{winning_player.name_str.upcase} A GAGNE !!".yellow.blink
    puts '='.yellow.blink * 70
    puts
    print_board(@board)
  end

  def drawn_view
    puts
    puts '='.yellow.blink * 70
    puts ' ' * 10 + 'EX AEQUO!!'.yellow.blink
    puts '='.yellow.blink * 70
    puts
    print_board(@board)
  end

  def start_again?
    puts
    puts 'Vous avez aimé? On recommence?'.blink
    print ' (oui/autre touche) > '
    restart_bool = gets.chomp.strip.casecmp('oui').zero?
    restart_bool ? (puts 'OK! On recommence') : (puts 'Au revoir !!')
    restart_bool
  end
end
