class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :name
      t.text :location
      t.timestamp :scheduled_at
      t.text :description

      t.timestamps
    end
  end
end
