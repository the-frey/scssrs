class Decision < ActiveRecord::Base

  attr_accessible :ip, :player_choice
  
  validates :ip, presence: true, length: { minimum: 2 }
  validates :player_choice, presence: true

  # In the model, though we don't persist the result
  def calculate_winner(ai_move, player_move)
    @player_wins = nil
    if ai_move == 0 && player_move == 1 # AI rock, player paper
      @player_wins = true
    elsif ai_move == 0 && player_move == 2 # AI rock, player scssrs
      @player_wins = false
    elsif ai_move == 1 && player_move == 0 # AI paper, player rock
      @player_wins = false
    elsif ai_move == 1 && player_move == 2 # AI paper, player scssrs
      @player_wins = true
    elsif ai_move == 2 && player_move == 0 # AI scssrs, player rock
      @player_wins = true
    elsif ai_move == 2 && player_move == 1 # AI scssrs, player paper
      @player_wins = false
    end
    return @player_wins
  end

  # Looks back at past moves from ip
  def generate_ai_move(ip_address)
    play = 0
    historic_plays = []
    historic_plays = Decision.where('ip = ?', ip_address).limit(100).order(:created_at)

    # Generate randomly if less than five moves or empty
    if historic_plays == [] || historic_plays.length < 5
      play = simple_ai_move
    elsif rand(2) == 0 # Inject some randomness
      play = simple_ai_move
    else # Let's predict some player behaviour
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

    # last_five = historic_plays[1..5] second pass should try this first
    # last_four = historic_plays[1..4] then this
    
    historic_plays_string = []
    historic_plays.each { |hp| historic_plays_string << hp.player_choice }
    historic_plays_string = historic_plays_string.join()

    last_three = []
    historic_plays[1..3].each { |lt| last_three << lt.player_choice }
    last_three_string = last_three.join()

    play = match_pattern_and_calculate(last_three_string, historic_plays_string)

    play ||= simple_ai_move
    play
  end

  # This method finds the string in the haystack and compiles an array of subsequent moves to the matched pattern
  def match_pattern_and_calculate(matcher, haystack)
    possible_moves = []
    continue = true

    until continue == false
      str = Regexp.new(matcher)
      index = str =~ haystack
      if index != nil
        possible_moves << haystack[(index - 1)]
        haystack = haystack[(index + 1)..-1]
      else
        continue = false
      end
    end

    play = most_common_subsequent_move(possible_moves) unless possible_moves == []
    play ||= nil
  end

  # This method finds the most common move from the subsequent moves array
  def most_common_subsequent_move(possible_moves)
    occurrences = {}

    possible_moves.each do |move|  
      occurrences[move].nil? ? occurrences[move] = 1 : occurrences[move] += 1
    end

    most_frequent = occurrences.max[0] unless occurrences == {}
    most_frequent.to_i unless most_frequent.nil?
  end
end