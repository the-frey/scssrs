require 'spec_helper'

describe DecisionsController do

  context 'playing rock' do
    before do
      post :move, format: :json, move: 'rock'
    end

    subject { response }

    its(:status) { should be 200 }
    its(:body) { should include 'rock' }
    specify { Decision.all.count.should be > 0 }
  end

  context 'playing paper' do
    before do
      post :move, format: :json, move: 'paper'
    end

    subject { response }

    its(:status) { should be 200 }
    its(:body) { should include 'paper' }
    specify { Decision.all.count.should be > 0 }
  end

  context 'playing scissors' do
    before do
      post :move, format: :json, move: 'scissors'
    end

    subject { response }

    its(:status) { should be 200 }
    its(:body) { should include 'scissors' }
    specify { Decision.all.count.should be > 0 }
  end

end