class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :id
      t.string  :title
      t.string  :body
      t.integer :user_id

      t.timestamps
    end
  end
end
