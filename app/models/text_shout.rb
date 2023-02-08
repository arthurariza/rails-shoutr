class TextShout < ApplicationRecord
  validates :body, presence: true, length: { in: 3..144 }
end
