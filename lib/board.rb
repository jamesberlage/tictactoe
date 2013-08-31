class Board

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

end