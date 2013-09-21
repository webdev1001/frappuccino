module Frappuccino
  class Property
  end
end

require 'frappuccino/property/map_property'

module Frappuccino
  class Property
    def initialize(zero, stream = nil)
      @value = zero

      if stream
        stream.on_value do |value|
          @value = value
        end
      end
    end

    def now
      @value
    end

    def sample(stream)
      stream.map do
        self.now
      end
    end

    def map(&blk)
      MapProperty.new(self, &blk)
    end
  end
end
