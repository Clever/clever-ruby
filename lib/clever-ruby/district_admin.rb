module Clever
  # District Admin resource
  class DistrictAdmin < APIResource
    include Clever::APIOperations::List
    @uri = 'district_admins'
    @plural = 'district_admins'
    @linked_resources = []

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:name, :title]
    end
  end
end
