require 'test_helper'

class ListTest < Test::Unit::TestCase
  should "retrieves districts" do
    Clever.api_key = "DEMO_KEY"
    VCR.use_cassette("districts") do
      Clever::District.all()
    end
  end

  should "retrieves schools" do
    Clever.api_key = "DEMO_KEY"
    VCR.use_cassette("schools") do
      Clever::School.all()
    end
  end

  should "retrieves students" do
    Clever.api_key = "DEMO_KEY"
    VCR.use_cassette("students") do
      @students = Clever::Student.all()
    end

    student = @students[0]
  end

  should "retrieves sections" do
    Clever.api_key = "DEMO_KEY"
    VCR.use_cassette("sections") do
      Clever::Section.all()
    end
  end

  should "retrieves teachers" do
    Clever.api_key = "DEMO_KEY"
    VCR.use_cassette("teachers") do
      @teachers = Clever::Teacher.all()

      for teacher in @teachers
        teacher_obj = Clever::Teacher.retrieve teacher.id
        assert_instance_of(Clever::Teacher, teacher)
        assert_instance_of(Clever::Teacher, teacher_obj)
        assert_equal(teacher, teacher_obj)
      end
    end
  end
end