class CreateAreas < ActiveRecord::Migration[4.2]
  def change
    create_table :areas do |t|
      t.string :area

      t.timestamps null: false
    end
  end
end
