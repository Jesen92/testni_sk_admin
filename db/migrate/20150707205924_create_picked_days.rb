class CreatePickedDays < ActiveRecord::Migration
  def change
    create_table :picked_days do |t|
      t.integer :day_id
      t.integer :repeat_id

      t.timestamps
    end
  end
end
