module Diagnostics
  class Sample
    class Log < ::Log
      def tag!(tags)
        tags << :diagnostics_sample
        tags << :library
        tags << :verbose
      end
    end
  end
end
