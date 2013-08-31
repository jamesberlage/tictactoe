require './lib/player'

class HumanPlayer < Player

  def make_move
    loc = get_location_of_move
    move(loc)

    rescue InvalidSpaceError
      puts "\nYou can't move into that space."
      retry
  end

  def get_location_of_move
    puts "\nWhat square would you like to take?"
    ans = gets.chomp

    raise InvalidAnswerError.new("invalid answer format") unless /^[0-2][,|\s]\s?[0-2]$/ === ans

    ans.split(/[,|\s]\s?/).map(&:to_i)

    rescue InvalidAnswerError
      puts "\nSorry, I couldn't understand that answer.  Try putting it in the form 'x, y'."
      retry
  end

end

class InvalidAnswerError < RuntimeError
end