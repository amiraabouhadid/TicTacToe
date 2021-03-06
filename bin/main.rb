#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'

class TicGame
  def initialize
    puts @board.show
    puts 'Welcome to Ruby\'s Tic Tac Toe!'
    player1 = Player.new(name('X'))
    player2 = Player.new(name('O'))
    puts "#{player1.name} will play with X and #{player2.name} will play with O"
    @game = Game.new(player1, player2)
    game_round
  end

  def name(token)
    case token
    when 'X'
      puts 'First player, please enter your name:'
    when 'O'
      puts 'Second player, please enter your name:'
    end
    name = gets.chomp
    name(token) if name.empty?
    name
  end

  def game_round
    loop do
      puts @game.board_update
      @game.assign_current_player
      puts @game.turn
      @game.count
      select_position
      if @game.winner
        puts @game.board_update
        puts @game.game_over(@game.winner)
        exit
      elsif @game.count == 9
        puts @game.board_update
        puts @game.game_over(nil)
        exit
      end
    end
  end

  def select_position
    input = gets.chomp.to_i
    position = if input.digits.length == 1
                 input - 1
               else
                 input
               end
    if @game.valid_move?(position)
      @game.move(position)
    else
      puts 'Invalid move, please enter a valid position'
      select_position
    end
  end
end
