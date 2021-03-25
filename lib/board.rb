class Board
  attr_reader :position

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]].flatten
  end

  def show
    '+---+---+---+'\
    '| #{@board[0]} | #{@board[1]} | #{@board[2]} |'\
    '+---+---+---+'\
    '| #{@board[3]} | #{@board[4]} | #{@board[5]} |'\
    '+---+---+---+'\
    '| #{@board[6]} | #{@board[7]} | #{@board[8]} |'\
    '+---+---+---+'
  end

  def position_filled?(position)
    @board[position] == 'X' || @board[position] == 'O'
  end

  def replace(token, position)
    @board[position] = token
  end

  def data
    @board
  end
end
