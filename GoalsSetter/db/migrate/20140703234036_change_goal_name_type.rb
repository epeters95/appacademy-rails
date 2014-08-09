class ChangeGoalNameType < ActiveRecord::Migration
  def change
    change_column :goals, :name, :text, null: false
  end
end
