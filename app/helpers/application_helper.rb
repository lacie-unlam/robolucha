module ApplicationHelper
  def not_found(klass)
    content_tag :p, content_tag(:em, "No se encontraron #{klass.model_name.human.pluralize}")
  end
  
  def format_time(time)
    time ||= 0
    mins, secs = time/60, time%60
    "#{mins < 10 ? "0#{mins}" : mins}:#{secs < 10 ? "0#{secs}" : secs}"
  end
  
  def mins(time, format = nil)
    m = time/60
    format.nil? || m > 9 ? m : "0#{m}"
  end  
  
  def secs(time, format = nil)
    s = time%60
    format.nil? || s > 9 ? s : "0#{s}"
  end
end
