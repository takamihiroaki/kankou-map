class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true


end
