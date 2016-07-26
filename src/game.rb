=begin
* Name: Tic Tac Toe
* Author: Ranon Martin - rm1905@nova.edu
* Date: October 2014
=end

require_relative "board"
require_relative "player"

class Game
	def initialize(player1_name, player2_name)
		@players = Array.new
		@players << Player.new(player1_name)
		@players << Player.new(player2_name)
	end


	def play_game(name)
		player = get_player(name)

		if player.nil?
			puts "I don't know that player. Please try again."
		else
			self.current_player = player
			setup_players

			@board = Board.new

			while true
				play

				if board.game_over?
					puts status_message
					return
				else
					swap_players
				end
			end
		end
	end


	private


	def next_move
		"#{current_player}, enter your next #{current_player.marker} move (1-9): "
	end


	def play
		while true
			position = current_player.ask "#{current_player}, enter your next #{current_player.marker} move (1-9): "
			moved = board.move(:position => position, :player => current_player)

			puts status_message if status_message

			board.display

			return if moved
		end
	end


	def status_message
		case board.status
		when :win
			"#{current_player}, you won!"
		when :tie
			"The game has been ended in a tie!"
		when :illegal
			"Bad move dude! you go again."
		when :invalid
			"Dude! your move should be 1-9, you go again."
		else
			false
		end
	end


	def get_player(name)
		players.detect { |player| player == name }
	end


	def setup_players
		players.each do |player|
			if player == current_player
				player.marker = 'O'
			else 
				player.marker = 'X'
			end
		end
	end


	def current_player=(player)
		@current_player = player
	end


	def current_player
		@current_player
	end


	def board
		@board
	end


	def players 
		@players
	end


	def swap_players
		self.current_player = players.detect { |player| not(player == current_player) }
	end
end
