module Clever
  class DistrictAdmin < APIResource
    include Clever::APIOperations::List
    @linked_resources = []

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:email, :title]
    end
  end
end
