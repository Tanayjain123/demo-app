class Post < ApplicationRecord
  belongs_to :user
  has_many :comments


  validates :author, presence: true
  validates :body, presence: true

  scope :published, -> (time){ where("published < ?", time)}

  scope :created_post, ->(val) { order('id desc').limit(val)}

  scope :search_like, -> (field_name, search_string) {where("#{field_name} LIKE ?", "%#{search_string}%")}

  before_create do
   puts Post.column_names
  end


  after_create do
   puts author
  end

end
