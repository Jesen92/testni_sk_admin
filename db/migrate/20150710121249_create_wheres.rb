class CreateWheres < ActiveRecord::Migration
  def change
    create_table :wheres do |t|
      t.string :name
      t.string :adress

      t.timestamps
    end
  end
end
