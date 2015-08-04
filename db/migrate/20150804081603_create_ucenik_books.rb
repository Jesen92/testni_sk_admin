class CreateUcenikBooks < ActiveRecord::Migration
  def change
    create_table :ucenik_books do |t|
      t.integer :book_id
      t.integer :ucenik_id

      t.timestamps
    end
  end
end
