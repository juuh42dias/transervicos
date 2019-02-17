class AddExtraFieldsToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :social_name, :string
    add_column :users, :civil_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
  end
end
