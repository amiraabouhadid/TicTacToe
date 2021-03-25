#!/usr/bin/env ruby
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Board
  attr_reader :position

  def initialize
    @board = Array.new(9, '')
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

  def position_filled?(position)
    @board[position] == 'X' || @board[position] == 'O'
  end

  def add(token, position)
    @board[position] = token
  end

  def data
    @board
  end
end

class Game
  attr_reader :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
  end

  def assign_current_player
    @current_player = case @current_player
                      when @player1
                        @player2
                      when @player2
                        @player1
                      else
                        [@player1, @player2].sample
                      end
  end

  def valid_move?(position)
    !@board.position_filled?(position) && position >= 0 && position <= 9
  end

  def move(position)
    case @current_player
    when @player1
      @board.add('X', position)
    when @player2
      @board.add('O', position)
    end
  end

  def turn
    puts "It's #{@current_player.name}'s turn!"
    puts "#{@current_player.name}, select a position 1-9:"
  end

  def count
    count = 0
    @board.data.each { |n| count += 1 if %w[X O].include?(n) }
    count
  end

  def winner
    arr = []
    [[0, 1, 2], [0, 3, 6], [0, 4, 8], [3, 4, 5], [1, 4, 7],
     [2, 4, 6], [6, 7, 8], [2, 5, 8]].flatten.each { |n| arr.push(@board.data[n]) }

    arr.each_slice(3).to_a.each { |n| return @current_player if [%w[X X X], %w[O O O]].include?(n) }
    nil
  end

  def game_over(result)
    case result
    when nil
      puts "It's a TIE"
    else
      puts "#{@current_player.name} wins, GAME OVER"
    end
  end
end

class TicGame
  def initialize
    @board = Board.new
    @board.show
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
      @board = Board.new
      @board.show
      @game.assign_current_player
      @game.turn
      @game.count
      select_position
      if @game.winner
        @game.game_over(@game.winner)
        @board.show
        exit
      elsif @game.count == 9
        @game.game_over(nil)
        @board.show
        exit
      end
    end
    reset
  end

  def select_position
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
