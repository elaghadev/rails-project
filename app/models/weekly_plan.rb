class WeeklyPlan < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :notes, dependent: :destroy
    
    validates :week, presence: true
    validates :goal, length: { maximum: 200 }
    
    enum category: { urgent: 0, low_priority: 1, important: 2, low_importance: 3 }
end
  