class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy


  # has_many :likes, dependent: :destroy

end
