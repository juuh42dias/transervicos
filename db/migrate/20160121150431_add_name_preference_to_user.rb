class AddNamePreferenceToUser < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :name_preference, :string, limit: 1
  end
end
