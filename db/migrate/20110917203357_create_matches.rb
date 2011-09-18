class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.text :description
      t.integer :points1
      t.integer :points2

      t.timestamps
    end
    
    add_index :matches, :team1_id
    add_index :matches, :team2_id
  end

  def self.down
    drop_table :matches
  end
end
