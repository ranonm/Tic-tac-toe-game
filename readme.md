# Tic-Tac-Toe Game

Individual graduate course work; Designed and implemented a two-player tic-tac-toe game in Ruby.

## Description
When a new game is created, two players register with it by name (the arguments to Game.new). The play_game message is called with one of the player’s names and starts a new game where that player plays first using the O marker. (A game can be sent repeated play_game messages so the same pair of players can play multiple games). In each iteration, the current player is prompted for the position of her move and then she enters the move number, where the nine squares are numbered in row-major order from 1 through 9. If a move is illegal (i.e., already occupied), the current player is scolded and prompted again for a move. After each move, the board is redrawn. A game ends when either one of the players forms a horizontal, vertical, or diagonal row of her three markers (in the usual way), or the board is full indicating a tie.

## Sample interaction for a typical game
```
>> gm = Game.new('bob', 'john')
=> #<Game:0x2e91d78 @players=[Bob, John]> 
>> gm.play_game('john')
John, enter your next O move (1-9): 1
O--
---
---
Bob, enter your next X move (1-9): 3
O-X
---
---
John, enter your next O move (1-9): 5
O-X
-O-
---
Bob, enter your next X move (1-9): 3
Bad move dude! You go again.
O-X
-O-
---
Bob, enter your next X move (1-9): 6
O-X
-OX
---
John, enter your next O move (1-9): 9
O-X
-OX
--O
John, you won!
=> nil
>> gm.play_game('lilly')
I don't know that player. Please try again. => nil
>> gm.play_game('bob')
Bob, enter your next O move (1-9): 5 
---
-O-
---
```

## Deliverables
The project deliverables included a sequence diagram to convey the interaction among the components, and the implementation of the game.


## System requirements
You need Ruby 2.2.1+ to run this project.
Please go to [Ruby-lang.org](https://www.ruby-lang.org/en/documentation/installation/) to download the latest version of Ruby.


## How to run

Run the program in your command-line terminal by:
1. Download source directory to desired location on local computer.
2. Enter source code directory.
3. Use irb to interact with the game. [Quick start with irb](https://www.ruby-lang.org/en/documentation/quickstart/)
* Type gm = Game.new("player1", "player2") then gm.play_game("player1") to start a game.
