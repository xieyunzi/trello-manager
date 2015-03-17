class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :email
      t.string :full_name
      t.string :initials
      t.string :avatar_id
      t.string :bio
      t.string :url

      t.timestamps null: false
    end

    change_column :members, :id, :string
  end
end
