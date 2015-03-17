class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :short_link
      t.string :id_short
      t.string :name

      t.timestamps null: false
    end

    change_column :cards, :id, :string
  end
end
