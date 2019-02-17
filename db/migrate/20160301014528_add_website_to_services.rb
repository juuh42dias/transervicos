class AddWebsiteToServices < ActiveRecord::Migration[4.2]
  def change
    add_column :services, :website, :string
  end
end
