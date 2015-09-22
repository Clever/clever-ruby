require 'test_helper'

describe Clever::APIResource do
  describe :named do
    let :resources do
      { district: Clever::District,
        school: Clever::School,
        section: Clever::Section,
        event: Clever::Event,
        teacher: Clever::Teacher,
        student: Clever::Student,
        district_admin: Clever::DistrictAdmin,
        school_admin: Clever::SchoolAdmin
      }
    end

    it 'returns nil on nonexistent resources' do
      Clever::APIResource.named('fake_resource').must_equal nil
    end

    it 'returns valid responses for both symbol and string inputs' do
      resources.each do |res_name, klass|
        Clever::APIResource.named(res_name.to_s).must_equal klass
        Clever::APIResource.named(res_name.to_sym).must_equal klass
      end
    end

    it 'returns valid responses for both singular and plural words' do
      resources.each do |res_name, klass|
        Clever::APIResource.named(res_name.to_s).must_equal klass
        Clever::APIResource.named(res_name.to_s.pluralize).must_equal klass
      end
    end
  end
end
