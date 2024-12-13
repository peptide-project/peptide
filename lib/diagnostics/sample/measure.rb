module Diagnostics
  class Sample
    class Measure
      include Dependency
      include Initializer
      include Configure
      include Log::Dependency

      configure :measure

      dependency :clock, Clock

      attr_writer :gc
      def gc
        @gc ||= Defaults.gc
      end

      initializer :action

      def configure(gc: nil)
        self.gc = gc unless gc.nil?

        Clock.configure(self)
      end

      def self.build(gc: nil, action: nil, &block_action)
        action ||= block_action

        instance = new(action)
        instance.configure(gc: gc)
        instance
      end

      def self.call(gc: nil, action: nil, &block_action)
        instance = build(gc: gc, action: action, &block_action)
        instance.()
      end

      def call(arg=nil)
        logger.trace { "Measuring action (GC: #{gc.inspect})" }

        ::GC.disable unless gc

        start_time = clock.now

        action.(arg)

        end_time = clock.now

        ::GC.enable unless gc

        elapsed_time_nanoseconds = end_time - start_time

        logger.trace { "Action measured (GC: #{gc.inspect}, Elapsed Time: #{LogText.elapsed_time_milliseconds(elapsed_time_nanoseconds)})" }

        elapsed_time_nanoseconds
      end

      module LogText
        def self.elapsed_time_milliseconds(elapsed_time_nanoseconds)
          "%fms" % Rational(elapsed_time_nanoseconds, 1_000_000)
        end
      end
    end
  end
end
