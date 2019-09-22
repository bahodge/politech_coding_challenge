require_relative 'row'

module Game
  class Board
    
    attr_reader :grid

    def initialize(grid: nil)
      @grid = grid ? grid : initial_grid
    end

    def find_cell_from_input(input: )
      coords = coords_from_input(input: input)
      return nil unless valid_coords?(coords: coords)
      return nil unless self.grid
      self.grid.each do |row|
        result = row.find_cell_by_coords(coords: coords)
        return result unless result.nil?
      end
    end

    # this returns a tuple of [x, y] coords
    def coords_from_input(input: )
      str = input.to_s.upcase
      fixed_str = str.gsub(' ', '')
      x = x_char_to_coord(char: fixed_str[0] )
      y = y_char_to_coord(char: fixed_str[1] )
      [x, y]
    end

    def valid_coords?(coords: )
      return false if coords == -1
      return false unless coords.length == 2
      return false unless coords.first <= 2 && coords.first >= 0
      return false unless coords.last <= 2 && coords.last >= 0
      true
    end

    private

    def initial_grid
      [
        Game::Row.new(y: 0),
        Game::Row.new(y: 1),
        Game::Row.new(y: 2),
      ]
    end

    # def x_char_to_coord(char: )
    #   return 0 if char == 'A'
    #   return 1 if char == 'B'
    #   return 2 if char == 'C'
    #   -1
    # end

    # def y_char_to_coord(char: )
    #   i = char.to_i
    #   return 0 if i == 1
    #   return 1 if i == 2
    #   return 2 if i == 3
    #   -1
    # end
  end

end
