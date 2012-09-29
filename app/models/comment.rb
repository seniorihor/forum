class Comment < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :topic_id

  belongs_to :user
  belongs_to :topic
end
