module TimeUtils
  def self.included(recipient)
    recipient.extend ClassMethods
    # recipient.send :include, InstanceMethods
  end

  module ClassMethods
    def time_writer(*attrs)
      attrs.each do |attr|
        define_method("#{attr}=") do |time|
          if time.is_a?(String)
            arr = time.split(":")
            t = arr.first.to_i.minutes + arr.second.to_i
          else
            t = time
          end
          
          write_attribute(attr, t)
        end
      end
    end
  end

  # module InstanceMethods
  # end
end