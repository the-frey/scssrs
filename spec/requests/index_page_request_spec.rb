# encoding: UTF-8
require 'spec_helper'

describe "Index page" do 

  subject { page }

  describe "visiting the page" do
    before { visit root_path }

    it { should have_content('h2', text: 'Try scssrs now!') }
  end
end