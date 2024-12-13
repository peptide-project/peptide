module Identifier
  module UUID
    class Random
      def get
        self.class.get
      end

      def self.get
        UUID.format(raw)
      end

      def self.raw
        SecureRandom.uuid
      end

      def self.configure(receiver, attr_name=nil)
        instance = new

        if attr_name.nil?
          if receiver.respond_to?(:identifier)
            attr_name = :identifier
          else
            attr_name = :uuid
          end
        end

        receiver.send "#{attr_name}=", instance

        instance
      end

      module Substitute
        def self.build
          Random.new
        end

        class Random < Identifier::UUID::Random
          def get
            @id ||= UUID.zero
          end

          def set(val)
            @id = val
          end
        end
      end
    end
  end
end
