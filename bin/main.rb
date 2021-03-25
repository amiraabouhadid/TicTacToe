#!/usr/bin/env ruby
class Game
  def initialize
    puts 'Welcome to Tic Tac Toe'
    player1 = Player.new(name('X'))
    player2 = Player.new(name('O'))
    @game = Game.new(player1, player2)
    game_round
  end

  def name(player)
    puts 'Enter player name :'
    name = gets.chomp
    name(player) if name.empty?
    name
  end

  def game_round
    loop do
      @game.current_player
      puts @game.turn
      puts @game.board
      player_input
      if @game.end?
        puts @game.game_over(@game.end)
      else
        puts @game.game_over(nil)
      end
      puts @game.board
    end
  end

  def player_input
    puts "#{@game.current_player.name}, select a position 1-9:"
    position = gets.chomp.to_i(-1)
    if @game.valid_move?(position)
      @game.move(position)
    else
      puts 'Invalid move, please enter a valid position.'
      player_input
    end
  end
end
Game.new
