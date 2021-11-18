require_relative "../lib/board"

describe Board do 
        describe "#board" do 
        subject(:board) {described_class.new}
        context "creates a new board" do 
            it "creates a new board"do
            board_slots = board.board.flatten
            expect(board_slots.all?("[]")).to eql(true)
        end
        end

        describe "#update_board" do 
        subject(:board) {described_class.new}
        context "it updates the board with the chip" do 
            it "places the piece on the bottom slot" do
                player = double("player")
                allow(player).to receive(:chip) { "blue" }
                allow(player).to receive(:position) { 0 } 
                subject.update_board(player.position, player.chip)
                expect(board.board[5][0]).to eql("blue")
            end

            it "places the chip on top of another chip" do 
                player = double("player")
                allow(player).to receive(:chip) { "blue" }
                allow(player).to receive(:position) { 0 } 
                subject.update_board(player.position,player.chip)
                subject.update_board(player.position,player.chip)
                expect(board.board[4][0]).to eql("blue")
                expect(board.board[5][0]).to eql("blue")
            end

            it "places only valid chips in range" do 
                player = double("player")
                display = double("display", :error => "Not a valid position enter a number between 0-7")
                player_two = double("player")
                allow(player).to receive(:chip) { "blue" }
                allow(player).to receive(:position) { 99 } 
                allow(player_two).to receive(:chip) { "blue" }
                allow(player_two).to receive(:position) { 0 } 
                subject.update_board(player.position,player.chip)
                subject.update_board(player_two.position,player.chip)
                expect(board.board[5][0]).to eql("blue")
            end

            it "returns an error message if the column is full" do
                player = double("player")
                allow(player).to receive(:chip) { "blue" }
                allow(player).to receive(:position) { 0 } 
                subject.update_board(player.position,player.chip)
                display = double("display", :error => "Not a valid position, column is full")
                6.times do 
                subject.update_board(player.position,player.chip)
                end
                expect(board.board[0][0]).to eql("blue")
            end
        end
    end
end
end