class CreateWeeklyPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_plans do |t|
      t.date :week
      t.string :category
      t.string :goal

      t.timestamps
    end
  end
end
