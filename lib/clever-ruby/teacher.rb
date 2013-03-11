module Clever
  class Teacher < APIResource
    include Clever::APIOperations::List

    def optional_attributes
      [:email, :teacher_number, :title]
    end
  end
end
