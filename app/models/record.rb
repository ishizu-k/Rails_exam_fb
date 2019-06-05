class Record < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 1000 }
end
