class Review < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  has_one_attached :image
  validates :name, :maker, :text, :sharpness, :richness, :sourness, :sweetness, :bitterness, :image, presence: true
  validates :name, :maker, length: { maximum: 20 }
  validates :text, length: { maximum: 140 }
  
  validates_with ImageAttachValidator
end