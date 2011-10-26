class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.integer :default_match_duration, :default => (1.minute + 30.seconds).to_i

      t.timestamps
    end
  end

  def self.down
    drop_table :configurations
  end
end
