module Clever
  class Student < APIResource
    include Clever::APIOperations::List
  end
end
