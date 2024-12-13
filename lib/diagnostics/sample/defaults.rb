module Diagnostics
  class Sample
    module Defaults
      def self.gc
        false
      end

      def self.cycles
        1
      end

      def self.warmup_cycles
        0
      end
    end
  end
end
