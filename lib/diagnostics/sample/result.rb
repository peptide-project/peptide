module Diagnostics
  class Sample
    class Result
      include Schema::DataStructure

      attribute :cycles, Integer, default: proc { 0 }
      attribute :time_milliseconds, Float, default: proc { 0.0 }
      attribute :time_sum_squares, Float, default: proc { 0.0 }

      attribute :warmup_cycles, Integer, default: proc { 0 }
      attribute :warmup_time_milliseconds, Float, default: proc { 0.0 }
      attribute :warmup_time_sum_squares, Float, default: proc { 0.0 }

      attribute :gc, Boolean, default: proc { false }

      def cycle(elapsed_time)
        self.time_milliseconds += elapsed_time

        self.time_sum_squares += (elapsed_time ** 2)

        self.cycles += 1
      end

      def mean_cycle_time_milliseconds
        time_milliseconds / cycles
      end

      def cycles_per_second
        cycles / (time_milliseconds / 1_000)
      end

      def time_standard_deviation
        variance = (time_sum_squares / cycles) - (mean_cycle_time_milliseconds ** 2)

        Math.sqrt(variance)
      end
      alias_method :standard_deviation, :time_standard_deviation

      def warmup_cycle(elapsed_time)
        self.warmup_time_milliseconds += elapsed_time

        self.warmup_time_sum_squares += (elapsed_time ** 2)

        self.warmup_cycles += 1
      end

      def mean_warmup_time_milliseconds
        warmup_time_milliseconds / warmup_cycles
      end

      def warmup_cycles_per_second
        warmup_cycles / (warmup_time_milliseconds / 1_000)
      end

      def warmup_time_standard_deviation
        variance = (warmup_time_sum_squares / warmup_cycles) - (mean_warmup_time_milliseconds ** 2)

        Math.sqrt(variance)
      end

      def digest
        <<~TEXT % [cycles, time_milliseconds, mean_cycle_time_milliseconds, standard_deviation, cycles_per_second, gc]
          Cycles: %d
          Time: %fms
          Mean Cycle Time: %fms (± %fms)
          Cycles Per Second: %f
          GC: #{gc ? 'on' : 'off'}
        TEXT
      end
      alias_method :to_s, :digest
    end
  end
end
