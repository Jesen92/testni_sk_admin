class CreateGroupUceniks < ActiveRecord::Migration
  def change
    create_table :group_uceniks do |t|
      t.integer :ucenik_id
      t.integer :group_id

      t.timestamps
    end
  end
end
