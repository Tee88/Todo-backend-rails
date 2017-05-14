class Item < ApplicationRecord
  validates :description, :status, presence: true
end
