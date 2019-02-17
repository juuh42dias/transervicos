class CreateVotingSessions < ActiveRecord::Migration[4.2]
  def change
    create_table :voting_sessions do |t|
      t.string :ip

      t.timestamps null: false
    end
  end
end
