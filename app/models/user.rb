class User < ActiveRecord::Base
  attr_accessible :firstname, :id, :lastname, :login, :password

  validates :firstname, :lastname, :login, :password, presence: true
  validates :firstname, :lastname, length: { in: 2..16 }
  validates :password, length: { in: 4..32 }
  validates :login, uniqueness: true

  has_many :topics
  has_many :comments

  def sign_up
    self.save
  end
end
