class Team < ActiveRecord::Base
  include TimeUtils
  
  validates :name, :presence => true, :uniqueness => true
  validates :approval_time, :numericality => { :greater_than_or_equal_to => 0 }
  
  scope :sorted, order("approval_time, name")
  
  before_save :humanize_name
  
  attr_accessible :name, :approval_time
  time_writer :approval_time
  
  def to_s
    name
  end
  
  private
  
  def humanize_name
    self.name = name.humanize
  end
end
