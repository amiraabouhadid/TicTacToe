#!/usr/bin/env ruby
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Board
  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def show
    puts '+---+---+---+'
    puts '| 1 | 2 | 3 |'
    puts '+---+---+---+'
    puts '| 4 | 5 | 6 |'
    puts '+---+---+---+'
    puts '| 7 | 8 | 9 |'
    puts '+---+---+---+'
  end
end

class Game
  attr_reader :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def assign_current_player
    @current_player = case @current_player
                      when @player1
                        @player2
                      when @player2
                        @player1
                      else
                        @player1
                      end
  end

  def show_turn
    "It's #{@current_player.name}'s turn"
  end

  def turn_count
    count = 0
    count += 1
    count
  end

  def win
    false
  end
end

class TicGame
  def initialize
    @board = Board.new
    @board.show
    puts 'Welcome to Ruby\'s Tic Tac Toe!'
    player1 = Player.new(name('X'))
    player2 = Player.new(name('O'))
    @game = Game.new(player1, player2)
    game_round
  end

  def name(token)
    puts 'Please enter player name:'
    name = gets.chomp
    name(token) if name.empty?
  end

  def game_round
    @game.assign_current_player
    puts @game.show_turn

    # while @game.turn_count <= 9 || @game.win
  end
end

TicGame.new
