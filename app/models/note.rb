class Note < ApplicationRecord
  belongs_to :weekly_plan

  validates :content, presence: true
end