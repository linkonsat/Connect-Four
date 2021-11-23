require_relative "../lib/game"

describe Game do 

    describe "#turn" do 
    subject(:game) { described_class.new }
    context "Selects correct turn " do 
        it "Selects player one" do 
            board = double("Board", :board => [["a","a","b"]])
            current_player = game.player_turn
            expect(current_player).to eql(0)
        end
        it "Selects player two" do 
            board = double("Board", :board => [["b", "b", "a"]])
            current_player = game.player_turn
            expect(current_player).to eql(1)
        end
    end
end

    describe "#setup" do 
    subject(:game) { described_class.new }
    it "Sets up correct variables on new game" do 
        game.setup
        expect(game.player_list.length).to eql(2)
        expect(game.board.board).to eql(Array.new(6) {Array.new(7,"[]")})
    end
end

    describe "#replay?" do
    subject(:game) { described_class.new }
    it "Calls main game method to start new game" do 
        game.replay
        expect(subject).to receive(:clear_values)
        expect(subject).to receive(:setup)
    end
end

    describe "#clear"  do 
    subject(:game) { described_class.new }
    it "Sets the game values back to nil" do 
        game.setup
        game.clear
        expect(game.player_list).to eql(nil)
        expect(game.board.board).to eql(Array.new(6) {Array.new(7,"[]")})
    end
end
    describe "#round" do
    subject(:game) { described_class.new }
    it "Runs a round if no win occurs" do 
        board = double("Board", :board => Array.new(6) {Array.new(7,"[]")})
        game.round
        expect(subject).to receive(:round)
    end
end
end