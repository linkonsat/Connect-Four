# frozen_string_literal: true

require_relative '../lib/player'
# so this test covers 3 things 1.picking a name 2. picking a symbol 3. selecting a position
describe Players do
  describe '#new_player_name' do
    subject(:player) { described_class.new }
    context 'Assigns a to the player object' do
      it 'Assigns a new player name on valid input' do
        allow(player).to receive(:gets).and_return('Snazzy')
        player.new_player_name
        expect(player.player_name).to eql('Snazzy')
      end
    end
  end
  describe '#assign_chip' do
    subject(:player) { described_class.new }
    context 'Assigns the appropriate player input' do
      it 'Selects the appropriate symbol on valid input' do
        allow(player).to receive(:gets).and_return('1')
        player.assign_chip
        expect(player.player_chip).to eql("\uFEFF\u{1F535}")
      end
      it "Doesn't assign the appropriate symbol until valid input occurs" do
        allow(player).to receive(:gets).and_return('9', '1')
        player.assign_chip
        expect(player.player_chip).to eql("\uFEFF\u{1F535}")
      end
    end
  end
  describe '#new_position' do
    subject(:player) { described_class.new }
    context 'Assigns the correct position' do
      it 'returns a valid position' do
        allow(player).to receive(:gets).and_return('5')
        player.new_position
        expect(player.selected_chip_position).to eql(5)
      end
      it "Doesn't assign the position until the valid position is entered" do
        allow(player).to receive(:gets).and_return('9', '5')
        player.new_position
        player.new_position
        expect(player.selected_chip_position).to eql(5)
      end
    end
  end
end
