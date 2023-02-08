class Shout < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :content, polymorphic: true

  validates :body, presence: true, length: { in: 3..144 }
end
