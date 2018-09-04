class Goal < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :links
  has_many :tasks, dependent: :destroy

  #accepts_nested_attributes_for :tasks
end

