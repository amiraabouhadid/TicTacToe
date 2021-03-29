require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'
require '../bin/main'

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

    describe '#initialize' do

        let(:player1) { Player.new('Amira') }
        let(:player2) { Player.new('Zil') }
        let(:game) { Game.new(player1, player2) }
        before { game.assign_current_player }

        it 'Creates empty board' do
            empty_board = "+---+---+---+ \n"\
                          "| 1 | 2 | 3 |\n"\
                          "+---+---+---+ \n"\
                          "| 4 | 5 | 6 |\n"\
                          "+---+---+---+ \n"\
                          "| 7 | 8 | 9 |\n"\
                          "+---+---+---+"
            expect(game.board_update).to eq(empty_board)
        end

        it 'Creates player names' do
            expect(player1.name).to eq('Amira')
            expect(player2.name).to eq('Zil')
        end

        it 'Assigns current player' do
            expect(game.current_player).to eq(player1).or(eq(player2))
        end

        it 'Declares draw' do
            draw_arr = [[0, 4], [8, 7], [6, 3], [1, 2]]
            draw_arr.each do |i|
                game.move(i[0])
                game.assign_current_player
                game.move(i[1])
                game.assign_current_player
            end
            game.move(5)
            
            expect(game.game_over(game.winner)).to eq("It's a TIE")
        end

        it "Wins with each wining combination" do
            game.assign_current_player         # And assigns the current player

            wining_combinations = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [3, 4, 5], [1, 4, 7],
                                    [2, 4, 6], [6, 7, 8], [2, 5, 8]]

            wining_combinations.each do |c|
                other_arr = (1..9).select { |item| !c.include?(item) }
                p other_arr
                (0..2).each do |i|
                    game.move(c[i])
                    game.assign_current_player
                    game.move(())
                    game.assign_current_player
                end
                puts game.board_update
            end

            expect(game.game_over(game.winner)).to eq("#{player1.name} wins, GAME OVER").or eq("#{player2.name} wins, GAME OVER")
        end
    end
end
