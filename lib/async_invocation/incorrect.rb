module AsyncInvocation
  class Incorrect
    class Error < RuntimeError; end

    def self.method_missing(meth, *args)
      raise Error, "Incorrect invocation of async operation. Intended use is invocation with a block argument. Results should be ignored."
    end
  end
end
