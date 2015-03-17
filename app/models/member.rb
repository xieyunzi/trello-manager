class Member < ActiveRecord::Base
  class << self
    def me
      @@me ||= Trello::Member.find(:me)
    end

    def refresh_notification(params = { read_filter: :unread })
      params = {} # for debug
      self.me.notifications(params).each do |n|
        logger.debug n.data

        board = Board.find_or_create_by id: n.data['board']['id'] do |b|
          b.short_link = n.data['board']['shortLink']
          b.name = n.data['board']['name']
        end if n.data['board']

        card = Card.find_or_create_by id: n.data['card']['id'] do |c|
          c.short_link = n.data['card']['shortLink']
          c.id_short = n.data['card']['idShort']
          c.name = n.data['card']['name']
        end if n.data['card']

        Notification.find_or_create_by id: n.id do |nf|
          nf.board = board
          nf.card = card

          nf.unread = n.unread
          nf.nf_type = n.type
          nf.date = n.date
          nf.content = n.data['text']
          nf.member_creator_id = n.member_creator_id
        end
      end
    end
  end
end
