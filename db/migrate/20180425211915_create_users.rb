class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.boolean :admin, default: false
      t.string :oauth_token
      t.index  :oauth_token, unique: true
      t.integer :faults, default: 0
      t.boolean :banned, default: false
      t.timestamps
    end
  end
end
