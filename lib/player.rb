require 'board'

class Player

  attr_accessor :symbol, :board

  def initialize(symbol, board)
    @symbol, @board = symbol, board
  end

  def move(loc)
    raise "space is already occupied" unless @board[loc].nil?
    @board[loc] = @symbol
  end

end