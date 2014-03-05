require 'spec_helper'

describe Decision do 
  
  before do
    @decision = Decision.new(ip: '127.0.0.1', player_choice: 'rock')
    @decision_two = Decision.new(ip: '127.0.0.1', player_choice: 'paper')
    @decision_three = Decision.new(ip: '127.0.0.1', player_choice: 'scissors')
  end

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

  describe "without ip" do
    before { @decision.ip = '' }
    it { should_not be_valid }
  end

  describe "without player_choice" do
    before { @decision.player_choice = '' }
    it { should_not be_valid }
  end

end