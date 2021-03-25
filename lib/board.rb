class Board
  attr_reader :position

  def initialize
    @board = Array.new(9, '')
  end

  def show
    '+---+---+---+'\
    '| 1 | 2 | 3 |'\
    '+---+---+---+'\
    '| 4 | 5 | 6 |'\
    '+---+---+---+'\
    '| 7 | 8 | 9 |'\
    '+---+---+---+'
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
