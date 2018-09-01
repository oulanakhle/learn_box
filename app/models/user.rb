class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :subjects

  devise :database_authenticatable, :trackable, :registerable,
         :recoverable, :rememberable, :validatable #:confirmable --> requires new views
end
