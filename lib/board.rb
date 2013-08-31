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

  def add_piece(sym, loc)
    x_coord, y_coord = loc[0], loc[1]
    @rows[x_coord][y_coord] = sym
  end

  def to_s
    "  0 1 2\n".tap do |rendered|
      @rows.each_with_index do |row, i|
        stringified_row = row.map { |el| el.nil? ? "_" : el.to_s.capitalize }
        rendered << "#{i}|#{stringified_row.join('|')}|\n"
      end
    end.chomp
  end

  def winning_board?
    LINES.any? { |line| line_wins?(line) }
  end

  def get_winning_symbol
    LINES.each do |line|
      return self[line.first] if line_wins?(line)
    end
  end

  def [](loc)
    x_coord, y_coord = loc[0], loc[1]
    @rows[x_coord][y_coord]
  end

  def []=(loc, sym)
    x_coord, y_coord = loc[0], loc[1]
    @rows[x_coord][y_coord] = sym
  end

  def line_wins?(line_coords)
    sym = self[line_coords.first]
    line_coords.all? { |coord| !self[coord].nil? && self[coord] == sym }
  end

end




















