class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :likes dependent: :destroy
  has_many :comments dependent: :destroy
  has_many :messages dependent: :destroy
  has_many :alerts dependent: :destroy
  has_many :orders dependent: :destroy
  has_one :address dependent: :destroy
end
