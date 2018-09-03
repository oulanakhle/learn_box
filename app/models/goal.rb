class Goal < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :links
  has_many :tasks
end
