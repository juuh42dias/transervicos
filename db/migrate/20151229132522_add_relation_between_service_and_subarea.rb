class AddRelationBetweenServiceAndSubarea < ActiveRecord::Migration[4.2]
  def change
    add_column :services, :subarea_id, :integer
    add_column :subareas, :area_id, :integer
  end
end
