require './lib/human_player'
require './lib/board'

class Game

  attr_accessor :x, :o, :board

  def initialize(board = nil, x = nil, o = nil)
    @board = board.nil? ? Board.new : board
    @x = x.nil? ? HumanPlayer.new(:x, @board) : x
    @o = o.nil? ? HumanPlayer.new(:o, @board) : o
  end

  def over?
    @board.winning_board? || @board.full?
  end

  def change_players(player)
    player == @x ? @o : @x
  end

  def play
    puts "Welcome to tic-tac-toe!"
    current_player = @x

    until over?
      display_board
      current_player.make_move
      current_player = change_players(current_player)
    end

    end_game
  end

  def display_board
    puts "\n#{@board.to_s}"
  end

  def end_game
    if @board.winning_board?
      winner = @board.get_winning_symbol
      display_board
      puts "\n#{winner.to_s.capitalize} won!"
    else
      display_board
      puts "\nThe game was a cat."
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  new_game = Game.new
  new_game.play
end







