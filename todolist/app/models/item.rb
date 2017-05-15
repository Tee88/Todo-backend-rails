class Item < ApplicationRecord
  validates :description, presence: true
  belongs_to :user
end
