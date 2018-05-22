class AddReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course
      t.datetime :published_at
      t.integer :state
      t.string :content
      t.timestamps
    end
  end
end
