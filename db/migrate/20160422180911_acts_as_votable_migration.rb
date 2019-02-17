class ActsAsVotableMigration < ActiveRecord::Migration[4.2]
  def self.up
    create_table :votes do |t|
      t.references :votable, polymorphic: true
      t.references :voter, polymorphic: true

      t.boolean :vote_flag
      t.string :vote_scope
      t.integer :vote_weight

      t.timestamps
    end

    create_indexes
  end

  def self.down
    drop_table :votes
  end

  private_class_method def self.create_indexes
    if ActiveRecord::VERSION::MAJOR < 4
      add_index :votes, [:votable_id, :votable_type]
      add_index :votes, [:voter_id, :voter_type]
    end

    add_index :votes, [:voter_id, :voter_type, :vote_scope]
    add_index :votes, [:votable_id, :votable_type, :vote_scope]
  end
end
