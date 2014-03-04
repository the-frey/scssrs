require 'spec_helper'

describe "Decisions [app index] page" do 

  subject { page }

  describe "visiting the page" do
    before { visit root_path }

    it { should have_selector('h2', text: 'Try scssrs now!') }

    describe "playing rochambeau", js: true do
      context 'playing rock' do
        before do
          page.find('.rock_button').click
        end

        it { should have_content("You played rock.") }
      end

      context 'playing paper' do
        before do
          page.find('.paper_button').click
        end

        it { should have_content("You played paper.") }
      end

      context 'playing scissors' do
        before do
          page.find('.scissors_button').click
        end

        it { should have_content("You played scissors.") }
      end
    end
  end
end