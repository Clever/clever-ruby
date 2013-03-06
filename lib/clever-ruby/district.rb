module Clever
  class District < APIResource
    include Clever::APIOperations::List

    def schools
      return @schools if @schools
      refresh
      schools_uri = links.detect {|link| link[:rel] == 'schools' }[:uri]
      response = Clever.request(:get, schools_uri)
      @schools = Util.convert_to_clever_object(response[:data])
    end
  end
end
