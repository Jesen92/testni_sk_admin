class CreateUcenikEvents < ActiveRecord::Migration
  def change
    create_table :ucenik_events do |t|
      t.integer :ucenik_id
      t.integer :single_event_id

      t.timestamps
    end
  end
end
