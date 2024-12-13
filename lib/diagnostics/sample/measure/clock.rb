module Diagnostics
  class Sample
    class Measure
      class Clock
        extend ::Configure::Macro

        self.default_factory_method = :new

        configure :clock

        def now
          Process.clock_gettime(
            Process::CLOCK_MONOTONIC,
            :nanosecond
          )
        end

        Substitute = ::Clock::UTC::Substitute
      end
    end
  end
end
