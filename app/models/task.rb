class Task < ApplicationRecord
  belongs_to :weekly_plan
  has_many :sub_tasks, dependent: :destroy

  validates :title, presence: true
end
