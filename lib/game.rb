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
      @board.replace('X', position)
    when @player2
      @board.replace('O', position)
    end
  end

  def turn
    "It's #{@current_player.name}'s turn!\n"\
    "#{@current_player.name}, select a position 1-9:"\
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

  def board_update
    @board.show
  end

  def game_over(result)
    case result
    when nil
      "It's a TIE"\
    else
      "#{@current_player.name} wins, GAME OVER"\
    end
  end
end
