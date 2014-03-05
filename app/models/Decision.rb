class Decision < ActiveRecord::Base

  attr_accessible :ip, :player_choice
  
  validates :ip, presence: true, length: { minimum: 2 }
  validates :player_choice, presence: true


  # In the model, though we don't persist the result
  def calculate_winner(ai_move, player_move)
    @player_wins = nil
    if ai_move == 0  && player_move == 1
      @player_wins = true
    elsif ai_move == 0  && player_move == 2
      @player_wins = false
    elsif ai_move == 1  && player_move == 0
      @player_wins = false
    elsif ai_move == 1  && player_move == 2
      @player_wins = true
    elsif ai_move == 2  && player_move == 0
      @player_wins = true
    elsif ai_move == 2  && player_move == 1
      @player_wins = false
    end
    return @player_wins
  end

  # Naive implementation that uses a random number generator
  def generate_ai_move 
    return rand(3)
  end

end