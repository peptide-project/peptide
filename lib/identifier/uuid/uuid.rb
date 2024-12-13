module Identifier
  module UUID
    def self.format(uuid)
      uuid.to_s
    end

    def self.random
      Random.get
    end

    def self.uuid?(text)
      uuid = parse(text)
      uuid == text
    end

    def self.parse(text)
      uuid = text.match(pattern).to_s
      uuid = nil if uuid == ''
      uuid
    end

    def self.pattern
      Pattern::TYPE_4
    end

    def self.zero
      '00000000-0000-0000-0000-000000000000'
    end
  end
end
