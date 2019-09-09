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
<<<<<<< HEAD
    input = gets.strip
=======
    input = gets.chomp
>>>>>>> d46b58dda3d7d9132cc8b165a6e4b7109af6f26f
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
<<<<<<< HEAD
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
=======
      display_board
    else
        turn
    end
  end
  
  def won?
   
  end
  
  def full?
    @board.count("X") || @board.count("O")
  end
  
  def draw?
    if @board.won? == false && @board.full? == true 
      true 
    elsif @board.won? == true 
      false 
    else 
      false
    end
  end
  
  def over?
    @board.won? == true || @board.full? == true
  end
  
  def winner
    puts "The winner is: #{winner}"
    display_board
>>>>>>> d46b58dda3d7d9132cc8b165a6e4b7109af6f26f
  end
  
end