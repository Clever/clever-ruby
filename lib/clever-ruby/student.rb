module Clever
  class Student < APIResource
    include Clever::APIOperations::List

    def photo
      return @values[:photo] if @values.has_key?(:photo)
      response, api_key = Clever.request(:get, photo_url, @api_key)
      @values[:photo] = response[:data][:data]
    end

    private

    def photo_url
      url + '/photo'
    end
  end
end
