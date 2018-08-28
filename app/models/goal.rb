class Goal < ApplicationRecord
  belongs_to :subject
  has_many :links
  has_many :tasks
end
