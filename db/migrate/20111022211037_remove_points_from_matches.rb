class RemovePointsFromMatches < ActiveRecord::Migration
  def self.up
    change_table :matches do |t|
      t.remove :points1
      t.remove :points2
    end
  end

  def self.down
    change_table :matches do |t|
      t.integer :points1
      t.integer :points2
    end
  end
end
