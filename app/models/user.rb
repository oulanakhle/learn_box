class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goals

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #:confirmable --> requires new views
         # :trackable --> requires current_sign_in_a method
end
