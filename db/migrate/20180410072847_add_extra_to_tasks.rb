class AddExtraToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :extra, :jsonb
  end
end
