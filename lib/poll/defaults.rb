class Poll
  module Defaults
    def self.interval_milliseconds
      0
    end

    def self.delay_condition
      lambda do |result|
        if result.respond_to?(:empty?)
          result.empty?
        else
          result.nil?
        end
      end
    end
  end
end
