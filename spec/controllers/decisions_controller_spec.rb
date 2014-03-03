require 'spec_helper'

describe DecisionsController do

  context 'playing rock' do
    before do
      post :move, format: :json, move_played: 'rock'
    end

    subject { response }

    its(:status) { should be 200 }
    its(:body) { should include 'You played rock.' }
  end

  context 'playing paper' do
    before do
      post :move, format: :json, move_played: 'paper'
    end

    subject { response }

    its(:status) { should be 200 }
    its(:body) { should include 'You played paper.' }
  end

  context 'playing scissors' do
    before do
      post :move, format: :json, move_played: 'scissors'
    end

    subject { response }

    its(:status) { should be 200 }
    its(:body) { should include 'You played scissors.' }
  end

end