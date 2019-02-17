class DropIndexesPgTrgmOnServices < ActiveRecord::Migration[4.2]
  def change
    ActiveRecord::Base.connection.execute('DROP INDEX IF EXISTS services_to_tsvector_idx;')
    ActiveRecord::Base.connection.execute('DROP INDEX IF EXISTS services_to_tsvector_idx1;')
  end
end
