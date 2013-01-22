require 'test_helper'
require 'clever-ruby'

class CleverTest < Test::Unit::TestCase
  should "set the api key" do
    Clever.api_key = "DEMO_KEY"
    assert_equal("DEMO_KEY", Clever.api_key)
  end

  should "return api urls" do
    assert_equal("https://api.getclever.com/v1.1/districts", Clever.api_url("districts"))
    assert_equal("https://api.getclever.com/v1.1/schools", Clever.api_url("schools"))
    assert_equal("https://api.getclever.com/v1.1/students", Clever.api_url("students"))
    assert_equal("https://api.getclever.com/v1.1/sections", Clever.api_url("sections"))
    assert_equal("https://api.getclever.com/v1.1/teachers", Clever.api_url("teachers"))
  end

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
