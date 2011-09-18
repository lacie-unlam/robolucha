class Match < ActiveRecord::Base
  include TimeUtils
  
  belongs_to :team1, :class_name => "Team", :foreign_key => :team1_id
  belongs_to :team2, :class_name => "Team", :foreign_key => :team2_id
  
  validates :team1_id, :numericality => { :greater_than => 0, :message => I18n.t("errors.messages.blank") }
  validates :team2_id, :numericality => { :greater_than => 0, :message => I18n.t("errors.messages.blank") }
  validates :duration, :numericality => { :greater_than => 0, :message => I18n.t("errors.messages.blank") }
  validates :points1, :numericality => true, :allow_nil => true
  validates :points2, :numericality => true, :allow_nil => true
  validate :teams_must_be_different
  
  scope :sorted, order("created_at desc")
  
  before_save :humanize_description
  
  attr_accessible :team1_id, :team2_id, :duration, :description, :points1, :points2
  time_writer :duration
  
  def to_s
    "#{team1} vs. #{team2}"
  end
  
  private
  
  def humanize_description
    self.description = description.humanize if description.present?
  end
  
  def teams_must_be_different
    errors.add(:team2_id) if team1_id && team2_id && team1_id == team2_id
  end
end
