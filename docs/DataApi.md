# Clever::DataApi

All URIs are relative to *https://api.clever.com/v1.2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_contact**](DataApi.md#get_contact) | **GET** /contacts/{id} | Get only a specific studentcontact&#39;s information.
[**get_contacts**](DataApi.md#get_contacts) | **GET** /contacts | Gets a list of student contacts you have access to.
[**get_contacts_for_student**](DataApi.md#get_contacts_for_student) | **GET** /students/{id}/contacts | Retrieves all contacts for a student.
[**get_district**](DataApi.md#get_district) | **GET** /districts/{id} | Get only a specific district&#39;s information.
[**get_district_admin**](DataApi.md#get_district_admin) | **GET** /district_admins/{id} | Retrieves a district admin
[**get_district_admins**](DataApi.md#get_district_admins) | **GET** /district_admins | Retrieves all users with admin access to a district.
[**get_district_for_school**](DataApi.md#get_district_for_school) | **GET** /schools/{id}/district | Retrieves district information for a school.
[**get_district_for_section**](DataApi.md#get_district_for_section) | **GET** /sections/{id}/district | Retrieves district information for a section.
[**get_district_for_student**](DataApi.md#get_district_for_student) | **GET** /students/{id}/district | Retrieves district information for a student.
[**get_district_for_student_contact**](DataApi.md#get_district_for_student_contact) | **GET** /contacts/{id}/district | Retrieves the district for a contact.
[**get_district_for_teacher**](DataApi.md#get_district_for_teacher) | **GET** /teachers/{id}/district | Retrieves district information for a teacher.
[**get_districts**](DataApi.md#get_districts) | **GET** /districts | Gets a list of districts you have access to.
[**get_grade_levels_for_teacher**](DataApi.md#get_grade_levels_for_teacher) | **GET** /teachers/{id}/grade_levels | Retrieves a list of all grade levels taught by a specific teacher.
[**get_school**](DataApi.md#get_school) | **GET** /schools/{id} | Get only a specific school&#39;s information.
[**get_school_admin**](DataApi.md#get_school_admin) | **GET** /school_admins/{id} | Get only a specific schooladmin&#39;s information.
[**get_school_admins**](DataApi.md#get_school_admins) | **GET** /school_admins | Gets a list of school_admins you have access to.
[**get_school_for_section**](DataApi.md#get_school_for_section) | **GET** /sections/{id}/school | Retrieves information about the school for a section
[**get_school_for_student**](DataApi.md#get_school_for_student) | **GET** /students/{id}/school | Retrieves information about the school for a student
[**get_school_for_teacher**](DataApi.md#get_school_for_teacher) | **GET** /teachers/{id}/school | Retrieves information about the school for a teacher
[**get_schools**](DataApi.md#get_schools) | **GET** /schools | Gets a list of schools you have access to.
[**get_schools_for_school_admin**](DataApi.md#get_schools_for_school_admin) | **GET** /school_admins/{id}/schools | Retrieves all schools for a school admin.
[**get_section**](DataApi.md#get_section) | **GET** /sections/{id} | Get only a specific section&#39;s information.
[**get_sections**](DataApi.md#get_sections) | **GET** /sections | Gets a list of sections you have access to.
[**get_sections_for_school**](DataApi.md#get_sections_for_school) | **GET** /schools/{id}/sections | Retrieves a list of all sections for a specific school.
[**get_sections_for_student**](DataApi.md#get_sections_for_student) | **GET** /students/{id}/sections | Retrieves a list of all sections for a student.
[**get_sections_for_teacher**](DataApi.md#get_sections_for_teacher) | **GET** /teachers/{id}/sections | Retrieves a list of all sections for a teacher.
[**get_student**](DataApi.md#get_student) | **GET** /students/{id} | Get only a specific student&#39;s information.
[**get_student_for_contact**](DataApi.md#get_student_for_contact) | **GET** /contacts/{id}/student | Retrieves the student for a contact.
[**get_students**](DataApi.md#get_students) | **GET** /students | Gets a list of students you have access to.
[**get_students_for_school**](DataApi.md#get_students_for_school) | **GET** /schools/{id}/students | Retrieves a list of all students for a specific school.
[**get_students_for_section**](DataApi.md#get_students_for_section) | **GET** /sections/{id}/students | Retrieves a list of all the section&#39;s students.
[**get_students_for_teacher**](DataApi.md#get_students_for_teacher) | **GET** /teachers/{id}/students | Retrieves all students that a teacher has in their sections.
[**get_teacher**](DataApi.md#get_teacher) | **GET** /teachers/{id} | Get only a specific teacher&#39;s information.
[**get_teacher_for_section**](DataApi.md#get_teacher_for_section) | **GET** /sections/{id}/teacher | Retrieves information about the primary teacher of a section.
[**get_teachers**](DataApi.md#get_teachers) | **GET** /teachers | Gets a list of teachers you have access to.
[**get_teachers_for_school**](DataApi.md#get_teachers_for_school) | **GET** /schools/{id}/teachers | Retrieves a list of all teachers for a specific school.
[**get_teachers_for_section**](DataApi.md#get_teachers_for_section) | **GET** /sections/{id}/teachers | Retrieves a list of all the section&#39;s teachers.
[**get_teachers_for_student**](DataApi.md#get_teachers_for_student) | **GET** /students/{id}/teachers | Retrieves all teachers for a student.


# **get_contact**
> StudentContactResponse get_contact(id)

Get only a specific studentcontact's information.

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
  #Get only a specific studentcontact's information.
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

Gets a list of student contacts you have access to.

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
  #Gets a list of student contacts you have access to.
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
> StudentContactsResponse get_contacts_for_student(id, opts)

Retrieves all contacts for a student.

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
  #Retrieves all contacts for a student.
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

[**StudentContactsResponse**](StudentContactsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_district**
> DistrictResponse get_district(id)

Get only a specific district's information.

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
  #Get only a specific district's information.
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

Retrieves a district admin

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
  #Retrieves a district admin
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

Retrieves all users with admin access to a district.

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
  #Retrieves all users with admin access to a district.
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

Retrieves district information for a school.

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
  #Retrieves district information for a school.
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

Retrieves district information for a section.

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
  #Retrieves district information for a section.
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

Retrieves district information for a student.

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
  #Retrieves district information for a student.
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

Retrieves the district for a contact.

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
  #Retrieves the district for a contact.
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

Retrieves district information for a teacher.

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
  #Retrieves district information for a teacher.
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



# **get_districts**
> DistrictsResponse get_districts(opts)

Gets a list of districts you have access to.

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

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  #Gets a list of districts you have access to.
  result = api_instance.get_districts(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling DataApi->get_districts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**DistrictsResponse**](DistrictsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_grade_levels_for_teacher**
> GradeLevelsResponse get_grade_levels_for_teacher(id)

Retrieves a list of all grade levels taught by a specific teacher.

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
  #Retrieves a list of all grade levels taught by a specific teacher.
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

Get only a specific school's information.

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
  #Get only a specific school's information.
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

Get only a specific schooladmin's information.

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
  #Get only a specific schooladmin's information.
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

Gets a list of school_admins you have access to.

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
  #Gets a list of school_admins you have access to.
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

Retrieves information about the school for a section

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
  #Retrieves information about the school for a section
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

Retrieves information about the school for a student

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
  #Retrieves information about the school for a student
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

Retrieves information about the school for a teacher

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
  #Retrieves information about the school for a teacher
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

Gets a list of schools you have access to.

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
  #Gets a list of schools you have access to.
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

Retrieves all schools for a school admin.

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
  #Retrieves all schools for a school admin.
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

Get only a specific section's information.

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
  #Get only a specific section's information.
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

Gets a list of sections you have access to.

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
  #Gets a list of sections you have access to.
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

Retrieves a list of all sections for a specific school.

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
  #Retrieves a list of all sections for a specific school.
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

Retrieves a list of all sections for a student.

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
  #Retrieves a list of all sections for a student.
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

Retrieves a list of all sections for a teacher.

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
  #Retrieves a list of all sections for a teacher.
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

Get only a specific student's information.

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
  #Get only a specific student's information.
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

Retrieves the student for a contact.

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
  #Retrieves the student for a contact.
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

Gets a list of students you have access to.

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
  #Gets a list of students you have access to.
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

Retrieves a list of all students for a specific school.

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
  #Retrieves a list of all students for a specific school.
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

Retrieves a list of all the section's students.

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
  #Retrieves a list of all the section's students.
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

Retrieves all students that a teacher has in their sections.

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
  #Retrieves all students that a teacher has in their sections.
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

Get only a specific teacher's information.

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
  #Get only a specific teacher's information.
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

Retrieves information about the primary teacher of a section.

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
  #Retrieves information about the primary teacher of a section.
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

Gets a list of teachers you have access to.

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
  #Gets a list of teachers you have access to.
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

Retrieves a list of all teachers for a specific school.

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
  #Retrieves a list of all teachers for a specific school.
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

Retrieves a list of all the section's teachers.

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
  #Retrieves a list of all the section's teachers.
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

Retrieves all teachers for a student.

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
  #Retrieves all teachers for a student.
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



