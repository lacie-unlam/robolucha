class AddRoundsNbrToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :rounds_nbr, :integer, :default => 3, :limit => 1
  end

  def self.down
    remove_column :matches, :rounds_nbr
  end
end
