require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]
    ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1 
    index
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    turn_count = 9 - @board.count(" ")
    turn_count
  end
  
  def current_player
    if turn_count.even? 
      token = "X"
    else
      token = "O"
    end
  end
  
  def turn
    puts "Please enter your move. Specify a position between 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && 
        (@board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]])
        return combo
      end
    end
  end
  
  def full?
    @board.count(" ") == 0 
  end
  
  def draw?
    won? == false && full? == true
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      winner = won?
      @board[winner[0]]
    end
  end
  
  def play 
    turn until over?
    
    if over? && !draw?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end