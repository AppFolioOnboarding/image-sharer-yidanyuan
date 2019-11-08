class Feedback < ApplicationRecord
  validates :user_name, presence: true
  validates :comment, presence: true
end
