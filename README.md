## Welcome to Scssrs

3.2.x Rails app, with testing in RSpec, you should be able to build and run it so long as you have Ruby and Rails installed on your machine. Simply clone the repository and `$ bundle install` to set up.

If you get an error with cross dependencies for `Nokogiri` and `libxml2`, try uninstalling and reinstalling Nokogiri manually:

    $ sudo gem uninstall nokogiri
    $ sudo gem install nokogiri

## Feature Plans

1. Test suite to cover main user flow [x]
2. Basic styles [x]
3. AJAX rock-paper-scissors with random AI plays [x]
4. Refactor handling each play into a model, move methods from controller [x]
5. Data capture (plays and IP location, perhaps) [x]
6. Intelligent (or semi-intelligent) algo for AI player
7. Create User or Player keyed to IP and track stats so play can resume
