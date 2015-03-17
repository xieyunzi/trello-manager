class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members, id: false do |t|
      t.string :id, index: true
      t.string :username
      t.string :email
      t.string :full_name
      t.string :initials
      t.string :avatar_id
      t.string :bio
      t.string :url

      t.primary_key :id
      t.timestamps null: false
    end
  end
end
