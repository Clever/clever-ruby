module Clever
  class Section < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      [:teacher, :course_name, :course_description, :course_number, :period, :grade, :term]
    end
  end
end
