class AddRoomSection < ActiveRecord::Migration[5.1]
  def change
    create_table :room_sections do |t|
      t.belongs_to :room
      t.belongs_to :section
      t.string :activity
      t.timestamps
    end
  end
end
