class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id
      t.text    :body
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
