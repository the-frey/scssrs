class Decision < ActiveRecord::Base

  attr_accessible :ip, :player_choice
  
  validates :ip, uniqueness: true, length: { minimum: 2 }
  validates :player_choice, presence: true

end