class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :post_date, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
