module Clever
  # District Admin resource
  class DistrictAdmin < APIResource
    include Clever::APIOperations::List
    @uri = 'district_admins'
    @plural = 'district_admins'
    @linked_resources = []

    # Override Clever::APIOperations::List.find so that response format
    #   has standard "data" and "uri" keys
    # @api public
    # array of ids will raise error since district admins do not allow 'where' param
    def self.find(id = nil, filters = {}, headers = {})
      filters = filters.merge(show_links: true)
      super
    end

    # Override Clever::APIOperations::List.first so that response format
    #   has standard "data" and "uri" keys
    # @api public
    # 'num' argument is not implemented since district admins do not allow 'limit' param
    def self.first(num = nil, filters = {}, headers = {})
      filters = filters.merge(show_links: true)
      response = Clever.request :get, url, filters, headers
      Util.convert_to_clever_object response[:data].first
    end

    # Optional attributes
    # @see Clever::CleverObject.optional_attributes
    # @api private
    # @return [Array]
    def optional_attributes
      [:name, :title]
    end
  end
end
