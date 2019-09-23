# Coding Challenge

- Ruby: `ruby 2.6.3`
- Bundler: `1.17.2`
- asdf: `v0.7.3`

## Tic Tack Toe

### How to run

- `bundle install` or `bundle`
- `ruby bin/tic_tack_toe.rb`
- `ruby bin/tic_tack_toe.rb --help` 
- `ruby bin/tic_tack_toe.rb --rules` 

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
- Able to read a specific cell with input
  
### Phase 3

- Adding basic game functionality like tracking who's turn it is and alternating turns.
- Checking to see if there is a winner
- Adding main game / turn loop
- Added turns

### Phase 4

- Adding basic ai rules -> grade possible turns
- making a move
- Integrated computer with main
- Imporved winner helper

### Phase 5

- Overall Cleanup and refactoring
- Finish the CLI
- Added some test for computer_spec
- Fixed a bit wrong with computer

## Postmortum

- The Sads
  - Wish I could have made a better AI
  - Wish I would have organized my code better
  - Wish I would have researched more on building AI
  - State doesn't do much
  - There are some edge cases that I can't account for yet
  - The AI doesn't try to defend itself from player wins
  - Winner helper should be more efficient
  - Computer should be more efficient

- The Glads
  - Built all in one day.
  - Built using TDD
  - Able to use Values effectively
  - Turn is the only real holder of state
  - Had a rough draft in 30 minutes

- Things I learned
  - Organizing a "railsless" directory structure
  - Accepting ARGS in ruby script
  - Using spec without rails
  - I love building from scratch

- How To improve
  - Better user input capture and sanitization
  - Better AI
  - Better state management
  - Better Tests
  - Add Leaderboard
    - Add abillty to share with friends / social media
  - Add Persisted Database
  - Add UI (not console)
  - Add more CLI options
  - Refactor Board, Computer and Winner Helper as they are the slowest pieces
  - Make everything a value object
  - Add a caching layer

- Takeaways
  - Had fun building the overall application
  - Wish I would have had more time to dedicate to fleshing out parts I wasn't happy with
  - Wish I had used more libraries / packages to solve a bunch of the little things for me
  