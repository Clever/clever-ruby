module Clever
  class District < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      # All of a district's attributes are required.
      []
    end
  end
end
