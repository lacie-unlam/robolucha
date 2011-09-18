class AddApprovalTimeToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :approval_time, :integer, :default => 0
  end

  def self.down
    remove_column :teams, :approval_time
  end
end
