class Comment < ApplicationRecord
  belongs_to :post
  has_many :replies , class_name: 'Comment',foreign_key: 'replycomment_id'
  belongs_to :replycomment, class_name: 'Comment'

  validates :author, presence: true

  before_create do
    puts post.valid?
    puts 'yes its valid'
  end
end



