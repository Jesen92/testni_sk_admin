class CreateVrstaTecajas < ActiveRecord::Migration
  def change
    create_table :vrsta_tecajas do |t|
      t.string :vrsta

      t.timestamps
    end
  end
end
