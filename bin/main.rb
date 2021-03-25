#!/usr/bin/env ruby
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
    name
  end

  def game_round
    loop do
      @board = Board.new
      @board.show
      @game.assign_current_player
      @game.turn
      select_position
      if @game.winner
        @game.game_over(@game.winner)
        @board.show
        exit
      elsif @game.turn == 9
        @game.game_over(nil)
        @board.show
        exit
      end
    end
    reset
    # while @game.turn_count <= 9 || @game.win
  end

  def select_position
    puts "#{@game.assign_current_player.name}, select a position 1-9:"
    position = gets.chomp.to_i - 1
    if @game.valid_move?(position)
      @game.move(position)
    else
      puts 'Invalid move, please enter a valid position'
      select_position
    end
  end
end

TicGame.new
