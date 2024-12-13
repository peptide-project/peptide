class Poll
  class Log < ::Log
    def tag!(tags)
      tags << :poll
      tags << :library
      tags << :verbose
    end
  end
end
