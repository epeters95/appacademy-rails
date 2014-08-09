class AddNotNullToGoalUserId < ActiveRecord::Migration
  def change
    change_column_null :goals, :user_id, false 
  end
end
