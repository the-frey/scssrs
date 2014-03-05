class DecisionsController < ApplicationController
  def index
  end

  def move
    
    @ip_address = request.remote_ip 
    @player_move = parse_player_move(params[:move])
    @decision = Decision.new(ip: @ip_address, player_choice: @player_move) unless @player_move.nil?
    @ai_move = @decision.generate_ai_move

    if !@decision.save
      render text: 'Invalid move', layout: false
    else
      respond_to do |format| 
        format.json do
          @response = {decision_id: @decision.id, ip_address: @ip_address, ai_move: @ai_move, player_move: params[:move]}
          @response[:tie] = true if @ai_move == @player_move
          @response[:won] = @decision.calculate_winner(@ai_move, @player_move) unless @ai_move == @player_move
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

end
