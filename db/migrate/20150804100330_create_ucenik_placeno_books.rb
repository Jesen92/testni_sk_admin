class CreateUcenikPlacenoBooks < ActiveRecord::Migration
  def change
    create_table :ucenik_placeno_books do |t|
      t.integer :ucenik_id
      t.integer :book_id

      t.timestamps
    end
  end
end
