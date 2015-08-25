class CreateProfesorJeziks < ActiveRecord::Migration
  def change
    create_table :profesor_jeziks do |t|
      t.integer :profesor_id
      t.integer :jezik_id

      t.timestamps
    end
  end
end
