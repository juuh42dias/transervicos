class AddEmailToReport < ActiveRecord::Migration[4.2]
  def change
    add_column :reports, :email, :string
  end
end
