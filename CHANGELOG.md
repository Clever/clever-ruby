## 2.0.3 (2022-01-21)

* Support ruby 3.x

## 2.0.2 (2019-01-03)

* Relax json dependency

## 2.0.1 (2018-05-15)

* Change students home_language 'Telegu' to 'Telugu'

## 2.0.0 (2017-11-03)

* Supports API version 2.0

## 1.2.4 (2017-08-24)

* Revert unnecessary json dependency upgrade introduced in 1.2.2
* Lock gem versions to allow Ruby 1.9 usage again

## 1.2.3 (2017-08-04)

* Fix DistrictStatus valid states

## 1.2.2 (2017-07-17)

* Fix Students.Created events to pull in ID and Type
* Fix /students/ID/contacts endpoint to read contacts correctly

## 1.2.1 (2017-06-27)

* Fixed events models

## 1.2.0 (2017-06-09)

* Added new fields for students and student contacts
* Fixed district status endpoint

## 1.1.0 (2017-05-02)

* Added support for enums
* Fixed typo in district_admin.launch_date

## 1.0.0 (2017-04-05)

* New auto-generated client library from v1.2

## 0.14.0 (2017-03-31)

* Add District Admins

## 0.13.2 (2016-02-08)

* Reduce constraint on multi_json

## 0.13.1 (2015-10-19)

* Fix bug where school_admins used incorrect event type

## 0.13.0 (2015-10-05)

* Add support for school admins

## 0.12.0 (2015-09-28)

* Remove inflector dependency

## 0.11.1 (2015-09-28)

* Fix APIError throwing a TypeError when API requests fail

## 0.11.0 (2015-09-28)

* Allow timeout and open_timeout configurable
* Allow nested resources more than 1 level deep

## 0.10.2 (2015-09-28)

* Remove duplicated code, test against Ruby 2.0.0

## 0.10.1 (2014-10-09)

* Update activesupport to 4.2.1

## 0.10.0 (2014-10-09)

* Add tracking headers to all api requeusts

## 0.9.0 (2014-10-02)

* Update district to accept optional auth token

## 0.8.0 (2014-09-12)

* Add last method to lists of results for all resources

## 0.7.0 (2014-09-12)

* Make nested resources support full queries, including find and count
* Make tests more robust to data changes

## 0.6.2 (2014-09-12)

* Update dependencies
* Add activesupport as dep
* Refactor tests

## 0.6.1 (2014-09-10)

* Add YARD documentation
* Remove unused Clever::Student.photo method

## 0.6.0 (2014-09-10)

* Add ActiveRecord-style find and count methods to all APIResources (#37)

## 0.5.0 (2014-09-09)

* Handle pagination through rel links, not manual numeric pagination (#36)

## 0.4.0 (2014-09-05)

* Linked resources for all API resources (#34)

## 0.3.0 (2014-02-28)

* Support for token auth (#17)
* Move to clever.com (#19)
