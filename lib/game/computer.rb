require 'values'

module Game
  class Computer < Value.new(:board)

    def make_move!
      p get_possible_moves

    end

    private

    def grade_moves
      # look at all the possible cells
      # for each cell
        # f
    end

    def get_possible_moves
      all_cells.collect {|cell| cell if cell.value == ' ' }.compact
    end

    def all_cells
      cells = []
        self.board.rows.each do |row|
          cells << row.cells
        end
      cells.flatten
    end

  end
end