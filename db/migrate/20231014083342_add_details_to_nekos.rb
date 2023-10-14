class AddDetailsToNekos < ActiveRecord::Migration[6.1]
  def change
    add_column :nekos, :detail, :text
  end
end
