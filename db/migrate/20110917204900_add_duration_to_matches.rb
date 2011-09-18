class AddDurationToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :duration, :integer
  end

  def self.down
    remove_column :matches, :duration
  end
end
