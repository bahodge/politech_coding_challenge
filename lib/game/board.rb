require_relative 'row'

module Game
  class Board
    attr_accessor :rows

    def initialize(rows: nil)
      @rows = rows ? rows : initial_rows
    end
    
    def set_cell_value(input:, value:)
      cell = find_cell_from_input(input: input)

      if cell&.can_update_value?
        new_cell = cell.set_value(new_value: value)
        row = cell.row
        row.cells[new_cell.x] = new_cell
        self.rows[row.y] = row
      else
        raise ArgumentError, "Could not update cell: #{input}, value: #{value}"
      end
    end

    def draw_board
      puts 
      puts 
      puts 
      puts 
      puts board_header
      puts "1 -> #{rows[0].to_line}"
      puts '     ===+===+==='
      puts "2 -> #{rows[1].to_line}"
      puts '     ===+===+==='
      puts "3 -> #{rows[2].to_line}"
      puts 
      puts 
      puts 
      puts 
    end

    def find_row_by_y(y:)
      self.rows.find { |row| row.y == y }
    end

    def find_cell_from_input(input:)
      coords = coords_from_input(input: input)
    
      return nil unless valid_coords?(coords: coords)
      return nil if self.rows.empty?

      row = find_row_by_y(y: coords.last)
      result = row&.find_cell_by_x(x: coords.first)
      result
    end

    # this returns a tuple of [x, y] coords
    def coords_from_input(input:)
      str = input.to_s.upcase
      fixed_str = str.gsub(' ', '')
      x = x_char_to_coord(char: fixed_str[0])
      y = y_char_to_coord(char: fixed_str[1])
      [x, y]
    end

    def valid_coords?(coords:)
      return false if coords.include?(-1)
      return false unless coords.length == 2
      return false unless coords.first <= 2 && coords.first >= 0
      return false unless coords.last <= 2 && coords.last >= 0

      true
    end

    private

    def board_header
      '      A   B   C'
    end

    def initial_rows
      [
        Game::Row.new(y: 0),
        Game::Row.new(y: 1),
        Game::Row.new(y: 2),
      ]
    end

    def x_char_to_coord(char:)
      return 0 if char == 'A'
      return 1 if char == 'B'
      return 2 if char == 'C'

      -1
    end

    def y_char_to_coord(char:)
      i = char.to_i
      return 0 if i == 1
      return 1 if i == 2
      return 2 if i == 3

      -1
    end
  end
end
