class AddAnotherPhoneToServices < ActiveRecord::Migration[4.2]
  def change
    add_column :services, :other_phone, :string
  end
end
