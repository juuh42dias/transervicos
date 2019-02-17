class AddServiceIdToAddress < ActiveRecord::Migration[4.2]
  def change
    add_column :addresses, :service_id, :integer
  end
end
