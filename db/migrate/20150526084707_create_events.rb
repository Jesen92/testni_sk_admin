class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.string :allDay
      t.integer :user_id
      t.integer :recurring_rule
      t.boolean :repeat
      t.date :repeat_until

      t.timestamps
    end
  end
end
