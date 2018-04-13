class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :title
      t.boolean :done
      t.timestamp :completed_at
      t.references :bucket, foreign_key: true

      t.timestamps
    end
  end
end
