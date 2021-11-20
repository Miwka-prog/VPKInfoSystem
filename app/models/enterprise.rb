class Enterprise < ApplicationRecord
  belongs_to :user
  has_many :products

  validates :title, :headquaters, presence: true
end
