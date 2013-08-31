require 'rspec'
require 'human_player'
require 'board'
require 'game'

describe Game do

  subject(:game) { Game.new }

  it "has players" do
    expect(game.x.class.ancestors.include?(Player)).to be_true
  end

  it "has a board" do
    expect(game.board.class).to eq(Board)
  end

  describe "#over?" do

    it "ends when the board is full" do
      test = Game.new(Board.new([[:x, :x, :o],[:o, :o, :x],[:x, :o, :x]]))
      expect(test.over?).to be_true
    end

    it "ends when a player has won" do
      test = Game.new(Board.new([[:x, nil, :o],[nil, :x, :o],[nil, nil, :x]]))
      expect(test.over?).to be_true
    end

    it "doesn't end if the game isn't over" do
      test = Game.new(Board.new([[:x, nil, :o],[nil, :x, :o],[nil, nil, nil]]))
      expect(test.over?).to be_false
    end

  end

  describe "#change_players" do

    it "changes a player to its opposite" do
      expect(game.change_players(game.o)).to eq(game.x)
    end

  end

end