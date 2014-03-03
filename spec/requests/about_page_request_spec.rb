# encoding: UTF-8
require 'spec_helper'

describe "About page" do 

  subject { page }

  describe "visiting the page" do
    before { visit about_page_path }

    it { should have_content('h2', text: 'About scssrs') }
  end
end