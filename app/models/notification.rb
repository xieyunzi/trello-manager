class Notification < ActiveRecord::Base
  belongs_to :board
  belongs_to :card
end
