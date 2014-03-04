class DecisionsController < ApplicationController
  def index
  end

  def move

    @ip_address = request.remote_ip
    @ai_move = generate_ai_move
    @player_move = parse_player_move(params[:move])

    if @player_move.nil?
      render text: 'Invalid move', layout: false
    else
      respond_to do |format| 
        format.json do
          @response = {ip_address: @ip_address, ai_move: @ai_move, player_move: params[:move]}
          @response[:tie] = true if @ai_move == @player_move
          @response[:won] = calculate_winner(@ai_move, @player_move) unless @ai_move == @player_move
          render json: @response.to_json, layout: false
        end
      end
    end

  end

  private

    # Convert player JSON string into number
    def parse_player_move(json_string)
      number = nil
      if json_string == 'rock'
        number = 0
      elsif json_string == 'paper'
        number = 1
      else
        number = 2
      end
      return number
    end

    # Naive implementation that uses a random number generator
    def generate_ai_move 
      return rand(3)
    end

    # Given we aren't using a db/models yet, this goes here
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
end
