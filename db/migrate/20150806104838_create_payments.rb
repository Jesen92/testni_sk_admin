class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :ucenik_id
      t.integer :group_id
      t.integer :uplata
      t.date :date

      t.timestamps
    end
  end
end
