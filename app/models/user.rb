class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :events

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
