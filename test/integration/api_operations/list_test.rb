require 'test_helper'

# Test api_operations/List
class ListTest < Test::Unit::TestCase
  def setup
    Clever.configure do |config|
      config.api_key = 'DEMO_KEY'
    end
  end

  should 'retrieve districts' do
    VCR.use_cassette('districts') do
      @districts = Clever::District.all
    end

    @districts.count.must_equal 1
  end

  should 'retrieve schools' do
    VCR.use_cassette('schools') do
      @schools = Clever::School.all
    end

    @schools.count.must_equal 3
  end

  should 'retrieve students' do
    VCR.use_cassette('students') do
      @students = Clever::Student.all
    end

    @students.count.must_equal 1004
  end

  should 'retrieve sections' do
    VCR.use_cassette('sections') do
      @sections = Clever::Section.all
    end

    @sections.count.must_equal 379
  end

  should 'retrieve teachers' do
    VCR.use_cassette('teachers') do
      @teachers = Clever::Teacher.all

      @teachers.each do |teacher|
        teacher_obj = Clever::Teacher.retrieve teacher.id
        assert_instance_of(Clever::Teacher, teacher)
        assert_instance_of(Clever::Teacher, teacher_obj)
        assert_equal(teacher, teacher_obj)
      end
    end
  end
end
