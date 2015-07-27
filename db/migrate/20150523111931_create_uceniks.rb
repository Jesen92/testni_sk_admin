class CreateUceniks < ActiveRecord::Migration
  def change
    create_table :uceniks do |t|
	  t.string :name
      t.integer :OIB
      t.string :adresa
      t.integer :group_id

      t.timestamps
    end
  end
end
