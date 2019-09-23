require 'values'

module Game
  class WinnerHelper < Value.new(:board)
    def check!
      all_cell_sets.each do |cell_set|
        values = filter_cell_values(cell_set: cell_set)
        return cell_set if all_match?(values: values)
      end

      nil
    end

    def filter_cell_values(cell_set:)
      filtered_values = []
      cell_set.collect { |cell| cell.value }.each do |value|
        if value == 'X' || value == 'O'
          filtered_values << value
        end
      end
      filtered_values
    end

    def all_match?(values:)
      return false unless values.length == 3

      value_1, value_2, value_3 = values

      return false unless value_1 == value_2
      return false unless value_1 == value_3

      true
    end

    private

    def all_cell_sets
      [
        column_cells_a,
        column_cells_b,
        column_cells_c,
        row_1_cells,
        row_2_cells,
        row_3_cells,
        diagonal_1_cells,
        diagonal_2_cells
      ]
    end

    def all_cells
      cells = []
      self.board.rows.each do |row|
        cells << row.cells
      end
      cells.flatten
    end

    def column_cells_a
      all_cells.select { |cell| cell.x == 0 }
    end

    def column_cells_b
      all_cells.select { |cell| cell.x == 1 }
    end

    def column_cells_c
      all_cells.select { |cell| cell.x == 2 }
    end

    def row_1_cells
      self.board.rows.first.cells
    end

    def row_2_cells
      self.board.rows[1].cells
    end

    def row_3_cells
      self.board.rows.last.cells
    end

    def diagonal_1_cells
      cells = []
      cells << board.find_cell_from_input(input: 'A1')
      cells << board.find_cell_from_input(input: 'B2')
      cells << board.find_cell_from_input(input: 'C3')
      cells
    end

    def diagonal_2_cells
      cells = []
      cells << board.find_cell_from_input(input: 'C1')
      cells << board.find_cell_from_input(input: 'B2')
      cells << board.find_cell_from_input(input: 'A3')
      cells
    end
  end
end
