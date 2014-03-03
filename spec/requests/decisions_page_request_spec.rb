require 'spec_helper'

describe "Decisions [app index] page" do 

  subject { page }

  describe "visiting the page" do
    before { visit root_path }

    it { should have_content('h2', text: 'Try scssrs now!') }

    describe "playing rochambeau" do
      pending
    end
  end
end