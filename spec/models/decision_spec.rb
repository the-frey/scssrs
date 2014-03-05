require 'spec_helper'

describe Decision do 
  
  @decision = Decision.new(ip: '127.0.0.1', player_choice: 'rock')
  @decision_two = Decision.new(ip: '127.0.0.1', player_choice: 'paper')
  @decision_three = Decision.new(ip: '127.0.0.1', player_choice: 'scissors')

  describe "new models" do 
    specify do
      @decision.should be_valid
      @decision_two.should be_valid
      @decision_three.should be_valid
    end
  end
  
  subject { @decision }

  it { should be_valid }
  it { should respond_to(:ip) }
  it { should respond_to(:player_choice) }

end