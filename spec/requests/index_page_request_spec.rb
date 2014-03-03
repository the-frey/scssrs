# encoding: UTF-8
require 'spec_helper'

describe "Index page" do 

  subject { page }

  describe "visiting the page" do
    before { visit root_path }

    it { should have_selector('h2', text: 'Try scssrs now!') }
    it { should have_content('Best our advanced chance engine to get your way at work, wow pointy-haired bosses or settle domestic disputes at home. Coin tossing is so last year.') }
  end
end