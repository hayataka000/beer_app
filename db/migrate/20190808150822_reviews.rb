class Reviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    t.string :name, null: true
    t.string :maker, null: true
    t.string :text, null: true
    t.integer :sharpness, null: true
    t.integer :richness, null: true
    t.integer :sourness, null: true
    t.integer :sweetness, null: true
    t.integer :bitterness, null: true
    t.integer :user_id, foreign_key: true, null: true
      t.timestamps
    end
  end
end
