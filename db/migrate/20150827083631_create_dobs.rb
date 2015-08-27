class CreateDobs < ActiveRecord::Migration
  def change
    create_table :dobs do |t|
      t.string :name

      t.timestamps
    end
  end
end
