class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :short_link
      t.string :name

      t.timestamps null: false
    end

    change_column :boards, :id, :string
  end
end
