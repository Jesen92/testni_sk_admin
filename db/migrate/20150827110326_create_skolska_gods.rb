class CreateSkolskaGods < ActiveRecord::Migration
  def change
    create_table :skolska_gods do |t|
      t.string :name

      t.timestamps
    end
  end
end
