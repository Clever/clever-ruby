require 'test_helper'

class ListTest < Test::Unit::TestCase
  should "retrieves districts" do
    Clever.api_key = "DEMO_KEY"
    Clever::District.all()
  end

  should "retrieves schools" do
    Clever.api_key = "DEMO_KEY"
    Clever::School.all()
  end

  should "retrieves students" do
    Clever.api_key = "DEMO_KEY"
    students = Clever::Student.all()
    student = students[0]
  end

  should "retrieves sections" do
    Clever.api_key = "DEMO_KEY"
    Clever::Section.all()
  end

  should "retrieves teachers" do
    Clever.api_key = "DEMO_KEY"
    teachers = Clever::Teacher.all()
    for teacher in teachers
      teacher_obj = Clever::Teacher.retrieve teacher.id
      assert_instance_of(Clever::Teacher, teacher)
      assert_instance_of(Clever::Teacher, teacher_obj)
      assert_equal(teacher, teacher_obj)
    end
  end
end