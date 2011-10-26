class Configuration < ActiveRecord::Base
  include TimeUtils
  
  validates :default_match_duration, :numericality => { :greater_than => 0, 
                                                        :message => I18n.t("errors.messages.blank") }
  
  time_writer :default_match_duration
end
