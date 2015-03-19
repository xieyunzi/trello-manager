class Notification < ActiveRecord::Base
  MENTIONED_ON_CARD = 'mentionedOnCard'.freeze
  MEMBER_JOINED_TRELLO = 'memberJoinedTrello'.freeze

  belongs_to :board
  belongs_to :card
  belongs_to :creator_member,
    class_name: Member,
    foreign_key: :member_creator_id

  def unread
    self[:unread].to_sym == :t ? true : false
  end
end
