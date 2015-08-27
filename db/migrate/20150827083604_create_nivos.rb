class CreateNivos < ActiveRecord::Migration
  def change
    create_table :nivos do |t|
      t.string :name

      t.timestamps
    end
  end
end
