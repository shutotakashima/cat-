class CreateNekos < ActiveRecord::Migration[6.1]
  def change
    create_table :nekos do |t|
      t.string :town
      t.text :way
      t.text :thing
      t.string :image
      t.integer :cost
      t.integer :user_id

      t.timestamps
    end
  end
end
