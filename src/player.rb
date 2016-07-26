=begin
* Name: Tic Tac Toe
* Author: Ranon Martin - rm1905@nova.edu
* Date: October 2014
=end

class Player
  attr_reader :name
  attr_accessor :marker

  def initialize(name)
    @name = name
  end

  def to_s
    name.capitalize
  end


  def inspect
    to_s
  end

  def ask(question)
    print question
    gets.chomp
  end

  def ==(subject)
    to_s.downcase.eql?(subject.to_s.downcase)
  end
end