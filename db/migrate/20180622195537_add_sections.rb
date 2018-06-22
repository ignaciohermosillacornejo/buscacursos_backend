class AddSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.belongs_to :course, index: true
      t.integer :number
      t.timestamps
    end
  end
end
