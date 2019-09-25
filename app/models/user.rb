class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :dob, presence: true 
  validates :gender, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts 
  has_many_attached :avatar     
end
