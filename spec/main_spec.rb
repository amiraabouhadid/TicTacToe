require_relative '../bin/main'

describe TicGame do
  let(:ticgame) { TicGame.new }
  describe '#name' do
    it 'returns the name of player given' do
      player1 = Player.new('amira')
      player2 = Player.new('omar')
      expect ticgame.name(player1).to eql('amira')
      expect ticgame.name(player2).to eql('omar')
    end
  end
  describe '#select_position' do
    it 'returns the position the player selected' do
      expect ticgame.select_position.to eql(position)
    end
  end
end
