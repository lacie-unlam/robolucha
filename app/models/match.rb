class Match < ActiveRecord::Base
  include TimeUtils
  
  belongs_to :team1, :class_name => "Team"
  belongs_to :team2, :class_name => "Team"
  has_many :rounds, :dependent => :delete_all
  
  validates :team1_id, :numericality => { :greater_than => 0, :message => I18n.t("errors.messages.blank") }
  validates :team2_id, :numericality => { :greater_than => 0, :message => I18n.t("errors.messages.blank") }
  validates :duration, :numericality => { :greater_than => 0, :message => I18n.t("errors.messages.blank") }
  validate :teams_must_be_different
  
  scope :sorted, order("created_at desc")
  
  before_save :humanize_description
  
  attr_accessible :team1_id, :team2_id, :duration, :description, :rounds_nbr
  time_writer :duration
  
  default_value_for :duration do
    (Configuration.first || Configuration.new).default_match_duration
  end
  
  def to_s
    "#{team1} vs. #{team2}"
  end
  
  def winner
    @winner ||= begin
      rounds_team1 = rounds.select {|round| round.winner == 1}.length
      rounds_team2 = rounds.select {|round| round.winner == 2}.length
      nbr_rounds_to_win = (rounds_nbr/2.0).ceil
      nbr_rounds_to_win += 1 if rounds_nbr.even?
      return team1 if rounds_team1 == nbr_rounds_to_win
      return team2 if rounds_team2 == nbr_rounds_to_win

      if rounds.size == rounds_nbr
        if rounds_team1 > rounds_team2
          team1
        elsif rounds_team1 < rounds_team2
          team2
        else
          points_team1 = rounds.inject(0) {|sum, round| sum + round.points_team1}
          points_team2 = rounds.inject(0) {|sum, round| sum + round.points_team2}
          
          if points_team1 > points_team2
            team1
          elsif points_team1 < points_team2
            team2
          end        
        end
      end
    end
  end
  
private
  
  def humanize_description
    self.description = description.humanize if description.present?
  end
  
  def teams_must_be_different
    errors.add(:team2_id) if team1_id && team2_id && team1_id == team2_id
  end
end
