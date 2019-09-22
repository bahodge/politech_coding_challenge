require 'values'

module Game
  class Cell < Value.new(:row, :x, :y, :value)
    def coords_to_input
      "#{x_to_input}#{self.y}"
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
  end
end
