class Game < ActiveRecord::Base
  belongs_to :player
  has_many :pogs
end
