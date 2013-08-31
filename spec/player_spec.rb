require 'rspec'
require 'player'
require 'board'

describe Player do

  subject(:player) { Player.new(:x, board) }
  let(:board) { Board.new }

  it "has a designated symbol" do
    expect(player.symbol).to eq(:x)
  end

  describe "#move" do

    it "adds a piece to the board" do
      board.should_receive(:[]=).with([0,1], :x)
      player.move([0,1])
    end

    it "should raise an error when the space is already occupied" do
      test = Board.new([[nil, nil, :o],[nil, nil, :x],[nil, nil, nil]])
      player.board = test
      expect { player.move([0,2]) }.to raise_error("space is already occupied")
    end

  end

end