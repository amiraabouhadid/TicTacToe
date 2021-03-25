#!/usr/bin/env ruby
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Board
  def initialize
    @board = Array.new(9, '')
  end

  def show
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]} \n
     #{@board[3]} | #{@board[4]} | #{@board[5]} \n
     #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def data
    @board
  end

  def add(token, position)
    @board[position] = token
  end

  def position_filled?(position)
    @board[position] == 'O' || @board[position] == 'X'
  end
end

class Game
  attr_reader :current_player, :board

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
  end

  def players_tokens
    @player1 = Player.new(name('X'))
    @player2 = Player.new(name('O'))
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

  def turn
    @board.show
    puts "It's #{assign_current_player.name}'s turn"
    count = 0
    @board.data { |n| count += 1 if %w[X O].include?(n) }
    count
  end

  def move(position)
    case @current_player
    when @player1
      @board.add('X', position)
    when @player2
      @board.add('O', position)
    end
  end

  def valid_move?(position)
    !@board.position_filled?(position) && position < 9 && position.positive?
  end

  def win
    arr = @board.data
  end
end

class TicGame
  def initialize
    puts "Welcome to Ruby's Tic tac Toe!"
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
      @game.turn
      player_input
      if @game.win?
        puts @game.game_over(@game.win)
      else
        puts @game.game_over(nil)
      end
      puts @game.board
    end
  end

  def player_input
    puts "#{@game.current_player.name}, select a position 1-9:"
    position = gets.chomp.to_i - 1
    if @game.valid_move?(position)
      @game.move(position)
    else
      puts 'Invalid move, please enter a valid position.'
      player_input
    end
  end
end

TicGame.new
