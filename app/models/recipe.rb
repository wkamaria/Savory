class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :category, presence: true
end
