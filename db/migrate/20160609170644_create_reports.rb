class CreateReports < ActiveRecord::Migration[4.2]
  def change
    create_table :reports do |t|
      t.string :detail
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
