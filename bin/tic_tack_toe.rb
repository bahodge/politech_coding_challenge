#! bin/sh env ruby

# Import the main class to initialize the program

require_relative '../lib/main.rb'

### Add options

### If no options are passed, make the player X

### help

### Leader board

### Start

### Choose your player: X or O

main = TicTackToe::Main.new
main.new_game

main.set_cell_value(input: 'B1')
main.set_cell_value(input: 'B2')
main.set_cell_value(input: 'B3')
main.set_cell_value(input: 'B3')
