class Comment < ApplicationRecord
  belongs_to :news
  belongs_to :user

  validates :content, presence: true
end
