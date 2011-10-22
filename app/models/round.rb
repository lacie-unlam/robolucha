class Round < ActiveRecord::Base
  validates :points_team1, :numericality => { :greater_or_equal_to => 0 }
  validates :points_team2, :numericality => { :greater_or_equal_to => 0 }
  validates :match_id, :presence => true
  
  belongs_to :match
  
  def winner
    if points_team1 > points_team2
      match.team1_id
    elsif points_team1 < points_team2
      match.team2_id
    end
  end
end
