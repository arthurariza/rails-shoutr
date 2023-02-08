class Shout < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :content, polymorphic: true

  validates_associated :content
end
