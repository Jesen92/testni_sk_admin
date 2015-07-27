class CreateSingleEvents < ActiveRecord::Migration
  def change
    create_table :single_events do |t|
      t.string :title
      t.string :start
      t.string :end
      t.string :start_date
      t.integer :profesor_id
      t.integer :group_id
      t.integer :where_id

      t.timestamps
    end
  end
end
