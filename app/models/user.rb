class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :dob, presence: true 
  validates :gender, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
