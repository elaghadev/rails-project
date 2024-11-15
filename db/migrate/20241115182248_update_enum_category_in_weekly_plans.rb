class UpdateEnumCategoryInWeeklyPlans < ActiveRecord::Migration[7.2]
  def up
    WeeklyPlan.where(category: 1).update_all(category: 10) # Update `not_urgent` to `low_priority`
    WeeklyPlan.where(category: 3).update_all(category: 20) # Update `not_important` to `low_importance`
  end

  def down
    WeeklyPlan.where(category: 10).update_all(category: 1) # Revert changes
    WeeklyPlan.where(category: 20).update_all(category: 3)
  end
end
