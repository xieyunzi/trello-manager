class Member < ActiveRecord::Base
  has_many :created_notifications,
    class_name: Notification,
    foreign_key: :member_creator_id

  def self.refresh_notification(trello_client, params = { read_filter: :unread })
    params = {} # for debug TODO
    me = trello_client.find(:members, :me)
    logger.debug "[DEBUG] trello me: #{me.inspect}"

    me.notifications(params).each do |n|
      logger.debug "[DEBUG] trello notification.data: #{n.data}"

      board = Board.find_or_create_by id: n.data['board']['id'] do |b|
        b.short_link = n.data['board']['shortLink']
        b.name = n.data['board']['name']
      end if n.data['board']

      card = Card.find_or_create_by id: n.data['card']['id'] do |c|
        c.short_link = n.data['card']['shortLink']
        c.id_short = n.data['card']['idShort']
        c.name = n.data['card']['name']
      end if n.data['card']

      begin
        Member.find(n.member_creator_id)
      rescue ActiveRecord::RecordNotFound
        # 可优化为 delay 执行
        member = trello_client.find(:members, n.member_creator_id)
        Member.create id: member.id,
          username: member.username,
          email: member.email,
          full_name: member.full_name,
          initials: member.initials,
          avatar_id: member.avatar_id,
          bio: member.bio,
          url: member.url
      end

      Notification.find_or_create_by id: n.id do |nf|
        nf.board = board
        nf.card = card

        nf.mentioned_to = me.id

        nf.unread = n.unread
        nf.nf_type = n.type
        nf.date = n.date
        nf.content = n.data['text']
        nf.member_creator_id = n.member_creator_id
      end
    end
  end
end
