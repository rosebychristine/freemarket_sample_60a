class Product < ApplicationRecord
  belongs_to :user
  belongs_to :shipping, optional: true
  has_many :comments
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :shipping, allow_destroy: true

  validates_presence_of :images
end
