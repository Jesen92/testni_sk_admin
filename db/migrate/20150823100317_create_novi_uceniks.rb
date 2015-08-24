class CreateNoviUceniks < ActiveRecord::Migration
  def change
    create_table :novi_uceniks do |t|
      t.integer :mjesto_id
      t.integer :jezik_id
      t.integer :vrsta_tecaja_id
      t.string :name
      t.string :parents_name
      t.string :tel
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
