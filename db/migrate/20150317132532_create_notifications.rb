class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :unread
      t.string :nf_type
      t.datetime :date
#      t.text :data
      t.text :content
      t.string :member_creator_id, index: true

      t.string :mentioned_to, index: true

      t.string :board_id
      t.string :card_id

      t.timestamps null: false
    end

    change_column :notifications, :id, :string
  end
end
