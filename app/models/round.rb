class Round < ActiveRecord::Base
  validates :points_team1, :numericality => { :greater_or_equal_to => 0 }
  validates :points_team2, :numericality => { :greater_or_equal_to => 0 }
  validates :match_id, :presence => true
  
  belongs_to :match
  
  def winner
    if points_team1 > points_team2
      1
    elsif points_team1 < points_team2
      2
    end
  end
end
