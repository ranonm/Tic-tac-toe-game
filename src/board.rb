=begin
* Name: Tic Tac Toe
* Author: Ranon Martin - rm1905@nova.edu
* Date: October 2014
=end

class Board
  attr_reader :status

  def initialize()
    @squares = Array.new(9)
  end
  

  def move(args)
    self.position = args[:position]
    self.player = args[:player]

    return false unless approved?

    mark_square
    redraw

    return true
  end


  def inspect
    
  end


  def game_over?
    if winner?
      self.status = :win
      true
    elsif tie?
      self.status = :tie
      true
    else
      false
    end
  end


  def display
    @grid.each do | row |
      row.each do | val |
        if val.nil?
          print "- "
        else
          print "#{val} "
        end
      end
      puts " "
    end
  end


  private

  def winner?
    possible_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ]

    possible_combinations.any? { |line| line.all? { |pos| squares[pos] == player.marker  }  }
  end


  def tie?
    not winner? and full?
  end


  def approved?
    if not valid_move?
      self.status = :invalid
      false
    elsif not legal_move?
      self.status = :illegal
      false
    else
      self.status = nil
      true  
    end
  end


  def valid_move?
    position.between?(0,8)
  end


  def legal_move?
    squares[position].nil?
  end


  def full?
    squares.all?{ |square| not square.nil? }
  end


  def position=(position)
    @position = to_zero_based(position.to_i)
  end


  def mark_square
    squares[position] = player.marker
  end


  def redraw
    @grid = [squares[0..2], squares[3..5], squares[6..8]]
  end


  def to_zero_based(position)
    position - 1
  end


  def squares
    @squares
  end


  def position
    @position
  end

  def player
    @player
  end


  def player=(player)
    @player = player
  end


  def status=(msg)
    @status = msg
  end
end