#! usr/bin/env ruby
# frozen_string_literal: true

require 'colorize'
require_relative 'game'
String.disable_colorization = false # enable colorization

class Router
  def self.perform
    system('clear')
    intro_view
    loop do
      player_1_name = Router.ask_name(first = true)
      player_2_name = Router.ask_name(first = false)
      break unless player_1_name.strip == player_2_name.strip
      puts
      puts 'Choisissez des noms différents BORDEL!! '
      puts '...'
      puts 'ON RECOMMENCE'
      sleep(1)
      puts
    end
    first_player_name, second_player_name =
      Router.select_first_player(player_1_name, player_2_name)
    Game.new(first_player_name, second_player_name)
  end

  def self.intro_view
    puts '=' * 70
    puts ' ' * 10 + 'JEU DU MORPION'
    puts '=' * 70
    puts
  end

  def self.ask_name(first)
    puts 'Entre le nom du joueur' + (first ? ' 1' : ' 2')
    print ' > '
    player_name = gets.chomp.capitalize
    puts
    puts "Bienvenue #{player_name} !"
    puts
    player_name
  end

  def self.select_first_player(player_1_name, player_2_name)
    puts "Commençons ! #{player_1_name}, #{player_2_name} : tirons aux dés qui jouera en premier!"
    sleep(1)
    loop do
      dice_roll_1 = Router.dice_roll(0.2, player_1_name)
      dice_roll_2 = Router.dice_roll(0.2, player_2_name)
      puts
      break unless dice_roll_2 == dice_roll_1
      puts
      puts 'Zut ! Egalité ! On recommence les lancers de dé'.red.blink
      sleep(1)
      puts
    end

    case (dice_roll_1 > dice_roll_2)
    when true
      show_first_and_second(player_1_name, player_2_name)
      return player_1_name, player_2_name
    when false
      show_first_and_second(player_2_name, player_1_name)
      return player_2_name, player_1_name
    end
  end

  def self.show_first_and_second(first_player_name, second_player_name)
    puts "#{first_player_name} : tu commences!".colorize(:blue)
    puts 'Tu seras le joueur bleu'.colorize(:blue).blink
    puts
    puts "#{second_player_name} : tu seras le joueur rouge".colorize(:red).blink
    puts
  end

  def self.dice_roll(sleep_time_in_sec = 0, player_name)
    puts '-' * 70
    puts '                  LANCER DE DE'
    puts '-' * 70
    puts
    puts "> #{player_name} lance.... "
    puts
    sleep(sleep_time_in_sec)
    print '> Ton résultat : '
    dice_result = Random.rand(1..6)
    puts dice_result
    dice_result
  end
end
