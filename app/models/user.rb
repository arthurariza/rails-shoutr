class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :username, uniqueness: true, presence: true

  has_many :shouts, dependent: :destroy

  has_one_attached :avatar do |avatar|
    avatar.variant :thumb, resize_to_limit: [48, 48]
    avatar.variant :profile, resize_to_limit: [150, 150]
  end
end
