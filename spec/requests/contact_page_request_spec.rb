# encoding: UTF-8
require 'spec_helper'

describe "Contact page" do 

  subject { page }

  describe "visiting the page" do
    before { visit contact_page_path }

    it { should have_content('h2', text: 'Contact scssrs') }
  end
end