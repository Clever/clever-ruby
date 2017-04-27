# Clever::EventsApi

All URIs are relative to *https://api.clever.com/v1.2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_event**](EventsApi.md#get_event) | **GET** /events/{id} | 
[**get_events**](EventsApi.md#get_events) | **GET** /events | 
[**get_events_for_school**](EventsApi.md#get_events_for_school) | **GET** /schools/{id}/events | 
[**get_events_for_school_admin**](EventsApi.md#get_events_for_school_admin) | **GET** /school_admins/{id}/events | 
[**get_events_for_section**](EventsApi.md#get_events_for_section) | **GET** /sections/{id}/events | 
[**get_events_for_student**](EventsApi.md#get_events_for_student) | **GET** /students/{id}/events | 
[**get_events_for_teacher**](EventsApi.md#get_events_for_teacher) | **GET** /teachers/{id}/events | 


# **get_event**
> EventResponse get_event(id)



Returns the specific event

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::EventsApi.new

id = "id_example" # String | 


begin
  result = api_instance.get_event(id)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling EventsApi->get_event: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**EventResponse**](EventResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_events**
> EventsResponse get_events(opts)



Returns a list of events

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::EventsApi.new

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_events(opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling EventsApi->get_events: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **Integer**|  | [optional] 
 **starting_after** | **String**|  | [optional] 
 **ending_before** | **String**|  | [optional] 

### Return type

[**EventsResponse**](EventsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_events_for_school**
> EventsResponse get_events_for_school(id, opts)



Returns a list of events for a school

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::EventsApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_events_for_school(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling EventsApi->get_events_for_school: #{e}"
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

[**EventsResponse**](EventsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_events_for_school_admin**
> EventsResponse get_events_for_school_admin(id, opts)



Returns a list of events for a school admin

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::EventsApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_events_for_school_admin(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling EventsApi->get_events_for_school_admin: #{e}"
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

[**EventsResponse**](EventsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_events_for_section**
> EventsResponse get_events_for_section(id, opts)



Returns a list of events for a section

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::EventsApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_events_for_section(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling EventsApi->get_events_for_section: #{e}"
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

[**EventsResponse**](EventsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_events_for_student**
> EventsResponse get_events_for_student(id, opts)



Returns a list of events for a student

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::EventsApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_events_for_student(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling EventsApi->get_events_for_student: #{e}"
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

[**EventsResponse**](EventsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_events_for_teacher**
> EventsResponse get_events_for_teacher(id, opts)



Returns a list of events for a teacher

### Example
```ruby
# load the gem
require 'clever-ruby'
# setup authorization
Clever.configure do |config|
  # Configure OAuth2 access token for authorization: oauth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Clever::EventsApi.new

id = "id_example" # String | 

opts = { 
  limit: 56, # Integer | 
  starting_after: "starting_after_example", # String | 
  ending_before: "ending_before_example" # String | 
}

begin
  result = api_instance.get_events_for_teacher(id, opts)
  p result
rescue Clever::ApiError => e
  puts "Exception when calling EventsApi->get_events_for_teacher: #{e}"
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

[**EventsResponse**](EventsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



