class RemoveNameFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :user, :bigint
  end
end
