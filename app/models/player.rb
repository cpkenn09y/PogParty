class Player < ActiveRecord::Base
  has_many :pogs
  has_many :games
end
