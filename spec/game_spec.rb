# frozen_string_literal: true

require_relative '../lib/game'
require 'pry-byebug'
describe Game do
  describe '#turn' do
    subject(:game) { described_class.new }
    context 'Selects correct turn ' do
      it 'Selects player one' do
        player_one = double('Player', player_chip: 'a')
        player_two = double('Player', player_chip: 'b')
        game.player_list = [player_one, player_two]
        board = double('Board', board: [%w[b b a]])
        game.board = board
        current_player = game.player_turn
        expect(current_player).to eql(0)
      end

      it 'Selects player two' do
        player_one = double('Player', player_chip: 'a')
        player_two = double('Player', player_chip: 'b')
        game.player_list = [player_one, player_two]
        board = double('Board', board: [%w[a a b]])
        game.board = board
        current_player = game.player_turn
        expect(current_player).to eql(1)
      end
      it 'Selects player one initially' do
        player_one = double('Player', player_chip: 'a')
        player_two = double('Player', player_chip: 'b')
        game.player_list = [player_one, player_two]
        board = double('Board', board: [%w[b a]])
        game.board = board
        current_player = game.player_turn
        expect(current_player).to eql(0)
      end
    end
  end

  describe '#setup' do
    subject(:game) { described_class.new }
    it 'Sets up correct variables on new game' do
      allow(game).to receive(:create_players).and_return('a', 'b')
      game.setup
      expect(game.player_list.length).to eql(2)
      expect(game.board.board).to eql(Array.new(6) { Array.new(7, '[]') })
    end
  end

  describe '#clear' do
    subject(:game) { described_class.new }
    it 'Sets the game values back to nil' do
      allow(game).to receive(:create_players).and_return('a', 'b')
      game.setup
      game.clear
      expect(game.player_list).to eql(nil)
      expect(game.board.board).to eql(Array.new(6) { Array.new(7, '[]') })
    end
  end
  describe '#round' do
    subject(:game) { described_class.new }
    it 'Runs a round if no win occurs' do
      board = double('Board', board: Array.new(6) { Array.new(7, '[]') })
      player_one = double('Player', player_chip: 'a', new_position: 0, selected_chip_position: 0)
      player_two = double('Player', player_chip: 'b', new_position: 0, selected_chip_position: 0)
      allow(board).to receive(:update_board).and_return(board.board[5][0] = 'a')
      allow(game).to receive(:round).and_return(false, true)
      game.player_list = [player_one, player_two]
      game.board = board
      game.round
      current_player = game.player_turn
      expect(current_player).to eql(1)
      expect(game.board.board).to_not eql(Array.new(6) { Array.new(7, '[]') })
    end
  end
end
