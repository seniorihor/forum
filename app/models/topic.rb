class Topic < ActiveRecord::Base
  attr_accessible :body, :id, :title, :user_id

  validates :body, length:  { in: 2..1024 }
  validates :title, length: { in: 2..32 }

  belongs_to :user
  has_many   :comments
end
