class AddOwnerFieldsToServices < ActiveRecord::Migration[4.2]
  def change
    add_column :services, :owner_name, :string
    add_column :services, :owner_email, :string
  end
end
