class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts


  validates :password, presence: true,
                       length: { minimum: 8 }


  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: {case_sensitive: false}

end
