class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :points_team1, :default => 0, :limit => 1
      t.integer :points_team2, :default => 0, :limit => 1
      t.integer :match_id
      t.datetime :created_at
    end
    
    add_index :rounds, :match_id
  end

  def self.down
    drop_table :rounds
  end
end
