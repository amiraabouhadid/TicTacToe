require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../bin/main'

player1 = Player.new('amira')
player2 = Player.new('omar')
game = Game.new(player1, player2)
board = Board.new

describe Game do
  describe '#valid_move?' do
    it 'returns true or false' do
      expect(game.valid_move?(1)).to eql(true)
      expect(game.valid_move?(0)).to eql(true)
      expect(game.valid_move?(12)).to eql(false)
      expect(game.valid_move?(10)).to eql(false)
      expect(game.valid_move?(3)).to eql(true)
    end
  end

  describe '#game_over' do
    it 'returns string' do
      current_player = game.assign_current_player
      expect(game.game_over(nil)).to eql("It's a TIE")
      expect(game.game_over(player1)).to eql("#{current_player.name} wins, GAME OVER")
      expect(game.game_over(player2)).to eql("#{current_player.name} wins, GAME OVER")
    end
  end

  describe '#assign_current_player' do
    it 'Assigns current player' do
      expect(game.current_player).to eq(player1).or(eq(player2))
    end
  end
end

describe Board do
  describe '#show' do
    it 'returns strings of board' do
      initial_board = "+---+---+---+ \n"\
        "| 1 | 2 | 3 |\n"\
        "+---+---+---+ \n"\
        "| 4 | 5 | 6 |\n"\
        "+---+---+---+ \n"\
        "| 7 | 8 | 9 |\n"\
        '+---+---+---+'
      expect(board.show).to eql(initial_board)
    end
  end
end

describe TicGame do
  describe '#name' do
    it 'returns player names as string' do
      expect(player1.name).to eq('amira')
      expect(player2.name).to eq('omar')
    end
  end
end
