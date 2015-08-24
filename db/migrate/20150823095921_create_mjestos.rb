class CreateMjestos < ActiveRecord::Migration
  def change
    create_table :mjestos do |t|
      t.string :naziv

      t.timestamps
    end
  end
end
