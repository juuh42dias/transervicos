class AddCityAndStateToAddress < ActiveRecord::Migration[4.2]
  def change
    add_column :addresses, :city_id, :integer
    add_column :addresses, :state_id, :integer
    remove_column :addresses, :city
    remove_column :addresses, :state
  end
end
