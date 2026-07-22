class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_recipes, through: :favorites, source: :recipe
  has_many :reviews, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true
end
