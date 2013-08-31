class Board

  LINES = [
    [[0,0], [0,1], [0,2]],
    [[1,0], [1,1], [1,2]],
    [[2,0], [2,1], [2,2]],
    [[0,0], [1,0], [2,0]],
    [[0,1], [1,1], [2,1]],
    [[0,2], [1,2], [2,2]],
    [[0,0], [1,1], [2,2]],
    [[0,2], [1,1], [2,0]]
  ]

  attr_accessor :rows

  def initialize(rows = nil)
    @rows = rows.nil? ? Array.new(3) { Array.new(3) } : rows
  end

  def dup
    new_rows = []

    @rows.each do |row|
      new_rows << row.dup
    end

    Board.new(new_rows)
  end

  def to_s
    "  0 1 2\n".tap do |rendered|
      @rows.each_with_index do |row, i|
        stringified_row = row.map { |el| el.nil? ? "_" : el.to_s.capitalize }
        rendered << "#{i}|#{stringified_row.join('|')}|\n"
      end
    end.chomp
  end

  def full?
    @rows.none? do |row|
      row.any? { |el| el.nil? }
    end
  end

  # A.I. ----------------------------------------------------------------------

  def winning_board?(player_symbol)
    LINES.any? do |line|
      line_hash = get_line_hash(line)
      line_hash[player_symbol] == 2 && line_hash[nil] == 1
    end
  end

  def losing_board?(player_symbol)
    winning_board?(switch_symbols(player_symbol))
  end

  def get_line_hash(line)
    {}.tap do |line_hash|
      line.each do |loc|
        line_hash[self[loc]] ||= 0
        line_hash[self[loc]] += 1
      end
    end
  end

  def switch_symbols(symbol)
    symbol == :x ? :o : :x
  end

  # ---------------------------------------------------------------------------

  def won?
    LINES.any? { |line| line_won?(line) }
  end

  def get_winning_symbol
    LINES.each do |line|
      return self[line.first] if line_won?(line)
    end
  end

  def [](loc)
    x_coord, y_coord = loc[0], loc[1]
    @rows[y_coord][x_coord]
  end

  def []=(loc, sym)
    x_coord, y_coord = loc[0], loc[1]
    @rows[y_coord][x_coord] = sym
  end

  def line_won?(line_coords)
    sym = self[line_coords.first]
    line_coords.all? { |coord| !self[coord].nil? && self[coord] == sym }
  end

end




















