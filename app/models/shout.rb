class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true, dependent: :destroy

  validates_associated :content
end
