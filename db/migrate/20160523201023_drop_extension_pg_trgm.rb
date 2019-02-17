class DropExtensionPgTrgm < ActiveRecord::Migration[4.2]
  def change
    ActiveRecord::Base.connection.execute('DROP EXTENSION IF EXISTS pg_trgm;')
  end
end
