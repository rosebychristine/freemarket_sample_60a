class Product < ApplicationRecord
  belongs_to :user
  belongs_to :shipping, optional: true
  has_many :comments
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :shipping, allow_destroy: true
  validates_presence_of :images
  validates :name, presence: true, length: {maximum: 6}
  validates :price, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :fee_burden, presence: true
  validates :shipping_time, presence: true
  validates :prefectures, presence: true
end
