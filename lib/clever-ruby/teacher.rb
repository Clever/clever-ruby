module Clever
  # Teacher resource
  class Teacher < APIResource
    include Clever::APIOperations::List
    @linked_resources = [:sections, :students, :schools, :districts, :events, :grade_levels]

    def optional_attributes
      [:email, :teacher_number, :title]
    end
  end
end
