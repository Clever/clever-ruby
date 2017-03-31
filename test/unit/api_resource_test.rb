require 'test_helper'

describe Clever::APIResource do
  let :resources do
    { district: { plural: 'districts', klass: Clever::District },
      school: { plural: 'schools', klass: Clever::School },
      section: { plural: 'sections', klass: Clever::Section },
      event: { plural: 'events', klass: Clever::Event },
      teacher: { plural: 'teachers', klass: Clever::Teacher },
      student: { plural: 'students', klass: Clever::Student },
      school_admin: { plural: 'school_admins', klass: Clever::SchoolAdmin },
      district_admin: { plural: 'district_admins', klass: Clever::DistrictAdmin } }
  end

  describe :singular do
    it 'identifies singular and plural resource names' do
      resources.each do |singular, klass_info|
        Clever::APIResource.singular?(singular).must_equal true
        Clever::APIResource.singular?(klass_info[:plural]).must_equal false
      end
    end

    it 'fails on non-resource names' do
      -> { Clever::APIResource.singular?('thing') }.must_raise RuntimeError
    end
  end

  describe :named do
    it 'returns nil on nonexistent resources' do
      Clever::APIResource.named('fake_resource').must_equal nil
    end

    it 'returns valid responses for both symbol and string inputs' do
      resources.each do |res_name, klass_info|
        Clever::APIResource.named(res_name.to_s).must_equal klass_info[:klass]
        Clever::APIResource.named(res_name.to_sym).must_equal klass_info[:klass]
      end
    end

    it 'returns valid responses for both singular and plural words' do
      resources.each do |res_name, klass_info|
        Clever::APIResource.named(res_name.to_s).must_equal klass_info[:klass]
        Clever::APIResource.named(
          klass_info[:plural]).must_equal klass_info[:klass]
      end
    end
  end
end
