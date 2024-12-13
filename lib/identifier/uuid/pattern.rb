module Identifier
  module UUID
    module Pattern
      TYPE_4 = %r{
        [a-f0-9]{8}          # abcdef01
        -                    #         -
        [a-f0-9]{4}          #          abcd
        -                    #              -
        4[a-f0-9]{3}         #               4abc
        -                    #                   -
        [89ab][a-f0-9]{3}    #                    8abc
        -                    #                        -
        [a-f0-9]{12}         #                         abcdef012345
      }xi
    end
  end
end
