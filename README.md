# Coding Challenge

- Ruby: `ruby 2.6.3`
- Bundler: `1.17.2`
- asdf: `v0.7.3`

## Tic Tack Toe

### How to run

- `ruby bin/tic_tack_toe.rb`

## Dev Diary

This will acts as my development diary as I develop the application

### Phase 1

- I rarely use plan old ruby projects, so setting up goes differently then "rails new"
- I created the directory structure along with installing 2 gems I know I'll be using, `rspec` and `values`
- Made initial script to be run to start the program. `bin/tic_tack_toe.rb`

### Phase 2

- Build board so that is populates with defaults
- Build row -> holds cells
- Build cells -> holds coords and values (data objects)
- Fill a cell with a specific value
  
### Phase 3

- Adding basic game functionality like tracking who's turn it is and alternating turns.
- Checking to see if there is a winner
- Adding main game / turn loop