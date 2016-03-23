module Clever
  # Contact resource
  class Contact < APIResource
    include Clever::APIOperations::List
    @uri = 'contacts'
    @plural = 'contacts'
    @linked_resources = [:district, :student]

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:email, :name, :phone, :type]
    end
  end
end
