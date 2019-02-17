class CreateExtensionUnaccent < ActiveRecord::Migration[4.2]
  def self.up
    ActiveRecord::Base.connection.execute('CREATE EXTENSION IF NOT EXISTS unaccent;')
  end

  def self.down
    ActiveRecord::Base.connection.execute('DROP EXTENSION unaccent;')
  end
end
