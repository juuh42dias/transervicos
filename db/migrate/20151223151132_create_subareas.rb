class CreateSubareas < ActiveRecord::Migration[4.2]
  def change
    create_table :subareas do |t|
      t.string :subarea

      t.timestamps null: false
    end
  end
end
