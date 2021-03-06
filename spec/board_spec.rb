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

  describe "#[]=" do

    it "adds an X to the board" do
      board[[0,2]] = :x
      expect(board.rows[2][0]).to eq(:x)
    end

  end

  describe "#[]" do

    it "gets the right symbol" do
      test = Board.new([[nil, nil, :o],[nil, nil, :x],[nil, nil, nil]])
      expect(test[[2,0]]).to eq(:o)
    end

  end

  describe "#full?" do

    it "identfies a full board" do
      test = Board.new([[:x, :x, :o],[:o, :o, :x],[:x, :o, :x]])
      expect(test.full?).to be_true
    end

    it "doesn't misidentify a board" do
      test = Board.new([[nil, nil, :o],[nil, nil, :x],[nil, nil, nil]])
      expect(test.full?).to be_false
    end

  end

  describe "#winning_board?" do

    it "identifies a winning board for X" do
      test = Board.new([[nil, :o, nil],[nil, nil, :x],[:o, nil, :x]])
      expect(test.winning_board?(:x)).to be_true
    end

    it "doesn't misidentify a board" do
      test = Board.new([[nil, nil, :o],[nil, nil, :x],[nil, nil, nil]])
      expect(test.winning_board?(:x)).to be_false
    end

  end

  describe "#losing_board?" do

    it "identifies a losing board for X" do
      test = Board.new([[nil, :x, nil],[nil, :o, nil],[:o, nil, :x]])
      expect(test.losing_board?(:x)).to be_true
    end

  end

  describe "#won?" do

    it "finds a diagonal win" do
      test = Board.new([[:x, nil, :o],[nil, :x, :o],[nil, nil, :x]])
      expect(test.won?).to be_true
    end

    it "finds a horizontal win" do
      test = Board.new([[:x, nil, :x],[:o, :o, :o],[nil, nil, :x]])
      expect(test.won?).to be_true
    end

    it "finds a vertical win" do
      test = Board.new([[:x, nil, :o],[nil, :x, :o],[nil, nil, :o]])
      expect(test.won?).to be_true
    end

    it "returns false when the game is not won" do
      test = Board.new([[:x, nil, :o],[nil, :x, :o],[nil, nil, nil]])
      expect(test.won?).to be_false
    end

  end

  describe "#get_winning_symbol" do

    it "returns the correct symbol of the winner" do
      test = Board.new([[:x, nil, :o],[nil, :x, :o],[nil, nil, :x]])
      expect(test.get_winning_symbol).to eq(:x)
    end

  end

end






















