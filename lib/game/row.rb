require 'values'
require_relative 'cell'

module Game
  class Row
    attr_reader :cells, :y

    def initialize(y: 0)
      @y = y
      @cells = build_cells
    end

    def build_cells
      [
        Game::Cell.with(x: 0, y: y, value: ''),
        Game::Cell.with(x: 1, y: y, value: ''),
        Game::Cell.with(x: 2, y: y, value: ''),
      ]
    end

    def find_cell_by_coords(coords: )
      searched_x = coords.first
      searched_y = coords.last

      return unless searched_y == self.y
  
      self.cells.find { |cell| cell.x == searched_x }
    end

  end
end