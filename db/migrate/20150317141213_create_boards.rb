class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards, id: false do |t|
      t.string :id, index: true
      t.string :shortLink
      t.string :name

      t.primary_key :id
      t.timestamps null: false
    end
  end
end
