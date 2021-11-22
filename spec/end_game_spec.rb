require_relative "../lib/end_game"
require "pry-byebug"
describe EndGame do
    describe "#vertical_win" do 
    subject(:end_game) { described_class.new }
    it "Returns true on a vertical win" do 
        board = double("Board", :board => [["[]"],["[]"],["a"],["a"],["a"],["a"]])
        player = double("Player", :chip => "a")
        result = end_game.vertical_win(board.board,player.chip)

        expect(result).to eql(true)
    end
end
    describe "#horizontal_win" do 
    subject(:end_game) { described_class.new }
    it "Returns true on a horizontal win" do 
        board = double("Board", :board => [["[]","[]","a","a","a","a"]])
        player = double("Player", :chip => "a")
        result = end_game.vertical_win(board.board,player.chip)
        expect(result).to eql(true)
    end
    describe "#diagonal_win" do 
    subject(:end_game) { described_class.new }
    it "Returns true on a diagonal win" do 
        board = double("Board", :board => [["a"],["[]","a"],["[]","[]","a"],["[]","[]","[]","a"]])
        player = double("Player", :chip => "a")
        result = end_game.vertical_win(board.board,player.chip)
        expect(result).to eql(true)
    end
end
    describe "#tie" do 
    subject(:end_game) { described_class.new }
end
    it "returns true on no winners" do 
        board = double("Board", :board => Array.new(6) {Array.new(7,"[]")})
        player = double("Player", :chip => "a")
        result = end_game.vertical_win(board.board,player.chip)
        expect(result).to eql(true)
    end
end
end