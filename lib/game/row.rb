require 'values'
require_relative 'cell'

module Game
  class Row
    attr_reader :y
    attr_accessor :cells

    def initialize(y: 0)
      @y = y
      @cells = build_cells
    end

    def to_line
      values = cells.collect(&:value)
      " #{values[0]} | #{values[1]} | #{values[2]} "
    end

    def build_cells
      [
        Game::Cell.with(row: self, x: 0, y: y, value: ' '),
        Game::Cell.with(row: self, x: 1, y: y, value: ' '),
        Game::Cell.with(row: self, x: 2, y: y, value: ' '),
      ]
    end

    def find_cell_by_x(x:)
      self.cells.find { |cell| cell.x == x }
    end

    def set_cell_value(cell:, value:)
      cell.set_value(new_value: value)
    end
  end
end
