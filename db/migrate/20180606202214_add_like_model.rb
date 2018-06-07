class AddLikeModel < ActiveRecord::Migration[5.1]
  def change
      create_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :review
      t.timestamps
    end
  end
end
