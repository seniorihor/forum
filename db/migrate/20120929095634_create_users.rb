class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string  :login
      t.string  :firstname
      t.string  :lastname
      t.string  :password

      t.timestamps
    end
  end
end
