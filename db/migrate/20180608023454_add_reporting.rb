class AddReporting < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.belongs_to :user, index: true
      t.belongs_to :review
      t.integer :state
      t.string :text
      t.timestamps
    end
  end
end
