# Clever::DataApi

All URIs are relative to *https://api.clever.com/v1.2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_contact**](DataApi.md#get_contact) | **GET** /contacts/{id} | 
[**get_contacts**](DataApi.md#get_contacts) | **GET** /contacts | 
[**get_contacts_for_student**](DataApi.md#get_contacts_for_student) | **GET** /students/{id}/contacts | 
[**get_district**](DataApi.md#get_district) | **GET** /districts/{id} | 
[**get_district_admin**](DataApi.md#get_district_admin) | **GET** /district_admins/{id} | 
[**get_district_admins**](DataApi.md#get_district_admins) | **GET** /district_admins | 
[**get_district_for_school**](DataApi.md#get_district_for_school) | **GET** /schools/{id}/district | 
[**get_district_for_section**](DataApi.md#get_district_for_section) | **GET** /sections/{id}/district | 
[**get_district_for_student**](DataApi.md#get_district_for_student) | **GET** /students/{id}/district | 
[**get_district_for_student_contact**](DataApi.md#get_district_for_student_contact) | **GET** /contacts/{id}/district | 
[**get_district_for_teacher**](DataApi.md#get_district_for_teacher) | **GET** /teachers/{id}/district | 
[**get_district_status**](DataApi.md#get_district_status) | **GET** /districts/{id}/status | 
[**get_districts**](DataApi.md#get_districts) | **GET** /districts | 
[**get_grade_levels_for_teacher**](DataApi.md#get_grade_levels_for_teacher) | **GET** /teachers/{id}/grade_levels | 
[**get_school**](DataApi.md#get_school) | **GET** /schools/{id} | 
[**get_school_admin**](DataApi.md#get_school_admin) | **GET** /school_admins/{id} | 
[**get_school_admins**](DataApi.md#get_school_admins) | **GET** /school_admins | 
[**get_school_for_section**](DataApi.md#get_school_for_section) | **GET** /sections/{id}/school | 
[**get_school_for_student**](DataApi.md#get_school_for_student) | **GET** /students/{id}/school | 
[**get_school_for_teacher**](DataApi.md#get_school_for_teacher) | **GET** /teachers/{id}/school | 
[**get_schools**](DataApi.md#get_schools) | **GET** /schools | 
[**get_schools_for_school_admin**](DataApi.md#get_schools_for_school_admin) | **GET** /school_admins/{id}/schools | 
[**get_section**](DataApi.md#get_section) | **GET** /sections/{id} | 
[**get_sections**](DataApi.md#get_sections) | **GET** /sections | 
[**get_sections_for_school**](DataApi.md#get_sections_for_school) | **GET** /schools/{id}/sections | 
[**get_sections_for_student**](DataApi.md#get_sections_for_student) | **GET** /students/{id}/sections | 
[**get_sections_for_teacher**](DataApi.md#get_sections_for_teacher) | **GET** /teachers/{id}/sections | 
[**get_student**](DataApi.md#get_student) | **GET** /students/{id} | 
[**get_student_for_contact**](DataApi.md#get_student_for_contact) | **GET** /contacts/{id}/student | 
[**get_students**](DataApi.md#get_students) | **GET** /students | 
[**get_students_for_school**](DataApi.md#get_students_for_school) | **GET** /schools/{id}/students | 
[**get_students_for_section**](DataApi.md#get_students_for_section) | **GET** /sections/{id}/students | 
[**get_students_for_teacher**](DataApi.md#get_students_for_teacher) | **GET** /teachers/{id}/students | 
[**get_teacher**](DataApi.md#get_teacher) | **GET** /teachers/{id} | 
[**get_teacher_for_section**](DataApi.md#get_teacher_for_section) | **GET** /sections/{id}/teacher | 
[**get_teachers**](DataApi.md#get_teachers) | **GET** /teachers | 
[**get_teachers_for_school**](DataApi.md#get_teachers_for_school) | **GET** /schools/{id}/teachers | 
[**get_teachers_for_section**](DataApi.md#get_teachers_for_section) | **GET** /sections/{id}/teachers | 
[**get_teachers_for_student**](DataApi.md#get_teachers_for_student) | **GET** /students/{id}/teachers | 


# **get_contact**
> StudentContactResponse get_contact(id)



Returns a specific student contact

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_contact(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_contact: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**StudentContactResponse**](StudentContactResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_contacts**
> StudentContactsResponse get_contacts(opts)



Returns a list of student contacts

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_contacts(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_contacts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**StudentContactsResponse**](StudentContactsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_contacts_for_student**
> StudentContactsByStudentResponse get_contacts_for_student(id, opts)



Returns the contacts for a student

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56 # Integer | 
}

begin
  result = api_instance.get_contacts_for_student(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_contacts_for_student: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 

### Return type

[**StudentContactsByStudentResponse**](StudentContactsByStudentResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district**
> DistrictResponse get_district(id)



Returns a specific district

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictResponse**](DistrictResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_admin**
> DistrictAdminResponse get_district_admin(id)



Returns a specific district admin

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district_admin(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_admin: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictAdminResponse**](DistrictAdminResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_admins**
> DistrictAdminsResponse get_district_admins(opts)



Returns a list of district admins

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

opts = { 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_district_admins(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_admins: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**DistrictAdminsResponse**](DistrictAdminsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_for_school**
> DistrictResponse get_district_for_school(id)



Returns the district for a school

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district_for_school(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_for_school: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictResponse**](DistrictResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_for_section**
> DistrictResponse get_district_for_section(id)



Returns the district for a section

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district_for_section(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_for_section: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictResponse**](DistrictResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_for_student**
> DistrictResponse get_district_for_student(id)



Returns the district for a student

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district_for_student(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_for_student: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictResponse**](DistrictResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_for_student_contact**
> DistrictResponse get_district_for_student_contact(id)



Returns the district for a student contact

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district_for_student_contact(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_for_student_contact: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictResponse**](DistrictResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_for_teacher**
> DistrictResponse get_district_for_teacher(id)



Returns the district for a teacher

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district_for_teacher(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_for_teacher: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictResponse**](DistrictResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district_status**
> DistrictStatusResponses get_district_status(id)



Returns the status of the district

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_district_status(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_district_status: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DistrictStatusResponses**](DistrictStatusResponses.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_districts**
> DistrictsResponse get_districts



Returns a list of districts

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

begin
  result = api_instance.get_districts
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_districts: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DistrictsResponse**](DistrictsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_grade_levels_for_teacher**
> GradeLevelsResponse get_grade_levels_for_teacher(id)



Returns the grade levels for sections a teacher teaches

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_grade_levels_for_teacher(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_grade_levels_for_teacher: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**GradeLevelsResponse**](GradeLevelsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_school**
> SchoolResponse get_school(id)



Returns a specific school

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_school(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_school: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SchoolResponse**](SchoolResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_school_admin**
> SchoolAdminResponse get_school_admin(id)



Returns a specific school admin

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_school_admin(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_school_admin: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SchoolAdminResponse**](SchoolAdminResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_school_admins**
> SchoolAdminsResponse get_school_admins(opts)



Returns a list of school admins

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_school_admins(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_school_admins: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**SchoolAdminsResponse**](SchoolAdminsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_school_for_section**
> SchoolResponse get_school_for_section(id)



Returns the school for a section

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_school_for_section(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_school_for_section: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SchoolResponse**](SchoolResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_school_for_student**
> SchoolResponse get_school_for_student(id)



Returns the primary school for a student

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_school_for_student(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_school_for_student: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SchoolResponse**](SchoolResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_school_for_teacher**
> SchoolResponse get_school_for_teacher(id)



Retrieves school info for a teacher.

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_school_for_teacher(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_school_for_teacher: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SchoolResponse**](SchoolResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_schools**
> SchoolsResponse get_schools(opts)



Returns a list of schools

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_schools(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_schools: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**SchoolsResponse**](SchoolsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_schools_for_school_admin**
> SchoolsResponse get_schools_for_school_admin(id, opts)



Returns the schools for a school admin

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_schools_for_school_admin(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_schools_for_school_admin: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**SchoolsResponse**](SchoolsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_section**
> SectionResponse get_section(id)



Returns a specific section

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_section(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_section: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**SectionResponse**](SectionResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_sections**
> SectionsResponse get_sections(opts)



Returns a list of sections

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_sections(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_sections: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**SectionsResponse**](SectionsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_sections_for_school**
> SectionsResponse get_sections_for_school(id, opts)



Returns the sections for a school

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_sections_for_school(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_sections_for_school: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**SectionsResponse**](SectionsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_sections_for_student**
> SectionsResponse get_sections_for_student(id, opts)



Returns the sections for a student

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_sections_for_student(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_sections_for_student: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**SectionsResponse**](SectionsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_sections_for_teacher**
> SectionsResponse get_sections_for_teacher(id, opts)



Returns the sections for a teacher

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_sections_for_teacher(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_sections_for_teacher: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**SectionsResponse**](SectionsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_student**
> StudentResponse get_student(id)



Returns a specific student

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_student(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_student: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**StudentResponse**](StudentResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_student_for_contact**
> StudentResponse get_student_for_contact(id)



Returns the student for a student contact

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_student_for_contact(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_student_for_contact: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**StudentResponse**](StudentResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_students**
> StudentsResponse get_students(opts)



Returns a list of students

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_students(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_students: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**StudentsResponse**](StudentsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_students_for_school**
> StudentsResponse get_students_for_school(id, opts)



Returns the students for a school

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_students_for_school(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_students_for_school: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**StudentsResponse**](StudentsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_students_for_section**
> StudentsResponse get_students_for_section(id, opts)



Returns the students for a section

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_students_for_section(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_students_for_section: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**StudentsResponse**](StudentsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_students_for_teacher**
> StudentsResponse get_students_for_teacher(id, opts)



Returns the students for a teacher

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_students_for_teacher(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_students_for_teacher: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**StudentsResponse**](StudentsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_teacher**
> TeacherResponse get_teacher(id)



Returns a specific teacher

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_teacher(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_teacher: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**TeacherResponse**](TeacherResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_teacher_for_section**
> TeacherResponse get_teacher_for_section(id)



Returns the primary teacher for a section

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_teacher_for_section(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_teacher_for_section: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**TeacherResponse**](TeacherResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_teachers**
> TeachersResponse get_teachers(opts)



Returns a list of teachers

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_teachers(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_teachers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**TeachersResponse**](TeachersResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_teachers_for_school**
> TeachersResponse get_teachers_for_school(id, opts)



Returns the teachers for a school

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_teachers_for_school(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_teachers_for_school: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**TeachersResponse**](TeachersResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_teachers_for_section**
> TeachersResponse get_teachers_for_section(id, opts)



Returns the teachers for a section

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_teachers_for_section(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_teachers_for_section: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**TeachersResponse**](TeachersResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_teachers_for_student**
> TeachersResponse get_teachers_for_student(id, opts)



Returns the teachers for a student

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::DataApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_teachers_for_student(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_teachers_for_student: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**TeachersResponse**](TeachersResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



