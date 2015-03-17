class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications, id: false do |t|
      t.string :id, index: true
      t.string :unread
      t.string :nf_type
      t.date :date
#      t.text :data
      t.text :content
      t.string :member_creator_id

      t.string :board_id
      t.string :card_id

      t.primary_key :id
      t.timestamps null: false
    end
  end
end
