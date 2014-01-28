class Game < ActiveRecord::Base
  belongs_to :player
  has_many :pogs

  attr_accessible :player1_id, :player2_id
end
