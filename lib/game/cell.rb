require 'values'


module Game
  class Cell < Value.new(:x, :y, :value)

    def coords_to_input
      "#{x_to_input}#{self.y}"
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