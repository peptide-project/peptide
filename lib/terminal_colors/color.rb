module TerminalColors
  module Color
    Error = Class.new(RuntimeError)

    def self.get(label_or_index)
      case label_or_index
      in Integer => index
        index
      in Symbol => label
        list.index(label)
      else
        raise Error, "Invalid label #{label_or_index.inspect}"
      end
    end

    def self.list
      @list ||= [
        :black,
        :red,
        :green,
        :yellow,
        :blue,
        :magenta,
        :cyan,
        :white
      ]
    end
  end
end
