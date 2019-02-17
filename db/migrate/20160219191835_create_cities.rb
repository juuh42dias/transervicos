class CreateCities < ActiveRecord::Migration[4.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :state_id

      t.timestamps null: false
    end
  end
end
