class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :likes 
  has_many :comments 
  has_many :messages 
  has_many :alerts 
  has_many :orders 
  has_one  :address 
end
