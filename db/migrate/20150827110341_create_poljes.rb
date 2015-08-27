class CreatePoljes < ActiveRecord::Migration
  def change
    create_table :poljes do |t|

      t.timestamps
    end
  end
end
