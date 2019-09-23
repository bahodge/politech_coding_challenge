require 'values'

module Game
  class Cell < Value.new(:row, :x, :y, :value)
    def coords_to_input
      "#{x_to_input}#{y_to_input}"
    end

    def set_value(new_value:)
      Game::Cell.with(row: self.row, x: self.x, y: self.y, value: new_value)
    end

    def can_update_value?
      self.value.strip == ""
    end

    private

    def x_to_input
      return 'A' if self.x == 0
      return 'B' if self.x == 1
      return 'C' if self.x == 2

      return -1
    end

    def y_to_input
      return 1 if self.y == 0
      return 2 if self.y == 1
      return 3 if self.y == 2

      return -1
    end
  end
end
