#! bin/sh env ruby

require_relative '../lib/main.rb'

def help
  puts """
    Thanks for playing my simple tic tack toe game
        -h, --help   - This will display this menu
          to play the game, simply run the script with `ruby ./bin/tic_tack_toe.rb`

        -r, --rules  - Display the rules of the game
      """
end

def rules
  puts """
    There is nothing special about this version of tic tack toe,
    the goal is to get 3 of your simples in a row either vertically,
    diagonally or horizontally.

    Each player will alternate turns until either a winner is crowned
    or there are no more spots left to play on.

    To choose a spot to play, please use the following system examples
    A1, B3, C2

    Thanks and good luck.
  """
end

def start_game
  main = TicTackToe::Main.new
  main.new_game
  main.play_turn
end

# first_argument = 

if ARGV[0] == '--help' || ARGV[0] == '-h'
  help
  exit
elsif ARGV[0] == '--rules' || ARGV[0] == '-r'
  rules
  exit
else
  start_game
end



