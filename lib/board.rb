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
