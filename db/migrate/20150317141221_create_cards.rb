class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards, id: false do |t|
      t.string :id, index: true
      t.string :shortLink
      t.string :idShort
      t.string :name

      t.primary_key :id
      t.timestamps null: false
    end
  end
end
