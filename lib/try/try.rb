module Try
  def self.call(*errors, error_probe: nil, &action)
    errors = errors.flatten
    success = false

    begin
      action.call
      success = true
    rescue StandardError => e
      unless errors.empty?
        unless errors.include? e.class
          raise e
        end
      end
    end

    error_probe.call(e) unless error_probe.nil?

    return success
  end
end
