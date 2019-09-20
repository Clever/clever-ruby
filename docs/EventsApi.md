# Clever::EventsApi

All URIs are relative to *https://api.clever.com/v2.1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_event**](EventsApi.md#get_event) | **GET** /events/{id} | 
[**get_events**](EventsApi.md#get_events) | **GET** /events | 


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

id = 'id_example' # String | 


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
  starting_after: 'starting_after_example', # String | 
  ending_before: 'ending_before_example', # String | 
  school: 'school_example', # String | 
  record_type: ['record_type_example'] # Array<String> | 
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
 **school** | **String**|  | [optional] 
 **record_type** | [**Array&lt;String&gt;**](String.md)|  | [optional] 

### Return type

[**EventsResponse**](EventsResponse.md)

### Authorization

[oauth](../README.md#oauth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



