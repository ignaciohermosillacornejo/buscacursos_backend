class AddRoom < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :x_coord
      t.integer :y_coord
      t.string :name
      t.timestamps
    end
  end
end
