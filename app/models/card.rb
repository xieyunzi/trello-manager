class Card < ActiveRecord::Base
  has_many :notifications
end
