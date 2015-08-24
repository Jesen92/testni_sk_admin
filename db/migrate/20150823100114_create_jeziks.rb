class CreateJeziks < ActiveRecord::Migration
  def change
    create_table :jeziks do |t|
      t.string :naziv

      t.timestamps
    end
  end
end
