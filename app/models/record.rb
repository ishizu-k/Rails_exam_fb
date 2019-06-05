class Record < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { in: 1..1000 }
end
