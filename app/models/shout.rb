class Shout < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :body, presence: true, length: { in: 3..144 }
end
