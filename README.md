## Welcome to Scssrs

3.2.x Rails app, with testing in RSpec, you should be able to build and run it so long as you have Ruby and Rails installed on your machine. Simply clone the repository and `$ bundle install` to set up.

If you get an error with cross dependencies for `Nokogiri` and `libxml2`, try uninstalling and reinstalling Nokogiri manually:

    $ sudo gem uninstall nokogiri
    $ sudo gem install nokogiri

# Feature Plans

1. Test suite to cover main user flow
2. Basic styles
3. AJAX rock-paper-scissors
4. Data capture (plays and IP location, perhaps)