module Clever
  class School < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      [:state_id, :sis_id, :nces_id, :low_grade, :high_grade, :principal, :location, :phone]
    end
  end
end
