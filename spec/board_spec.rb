require 'rspec'
require 'board'

describe Board do

  subject(:board) { Board.new }

  it "initializes rows to nil" do
    expect(board.rows).to eq(Array.new(3) { Array.new(3) })
  end

  it "can be initialized with another board" do
    test = Board.new([4,5,6])
    expect(test.rows).to eq([4,5,6])
  end

  it "creates an array of 3 arrays" do
    expect(board.rows.first.is_a?(Array)).to be_true
  end

  describe "#to_s" do

    it "displays a board" do
      expect(board.to_s).to eq("  0 1 2\n0|_|_|_|\n1|_|_|_|\n2|_|_|_|")
    end

    it "displays a board with a symbol" do
      test = Board.new([[nil, nil, :o],[nil, nil, :x],[nil, nil, nil]])
      expect(test.to_s).to eq("  0 1 2\n0|_|_|O|\n1|_|_|X|\n2|_|_|_|")
    end

  end

  describe "#add_piece" do

    it "adds an X to the board" do
      board.add_piece(:x,[0,2])
      expect(board.rows[0][2]).to eq(:x)
    end

  end

end