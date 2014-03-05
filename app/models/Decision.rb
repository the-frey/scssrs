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

  # Looks back at past moves from ip
  def generate_ai_move(ip_address)
    play = 0
    historic_plays = []
    historic_plays = Decision.where('ip = ?', ip_address).limit(100).order(:created_at)

    logger.debug "#{historic_plays.inspect}"

    if historic_plays == []
      play = simple_ai_move
    else
      play = complex_ai_move(historic_plays)
    end

    play
  end

  # Naive implementation that uses a random number generator
  def simple_ai_move 
    return rand(3)
  end

  # Tries to find a simple pattern
  def complex_ai_move(historic_plays) 
    play = nil
    last_five = historic_plays[1..5]
    last_four = historic_plays[1..4]
    last_three = historic_plays[1..3]

    play ||= simple_ai_move
    play
  end

end