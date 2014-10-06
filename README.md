# Oracle Social Relationship Management (SRM) API Example

This app is a barebones Ruby on Rails application that gives an example how to authenticate and use SRM's public API.

To keep the app simple, there is no database requirement and any reference to a specific user or login of a user in the sample app was avoided.

In typical OAuth implementations, it's likely your application will have user models and there will be some association of access tokens to these users. For example, you will have a `users` table and an `authentications` table, and a record in the `authentications` table will correspond to a user.

For this app, we will only store a single JSON object returned to us from the OAuth process in `token.json` under `config/`, and any subsequent calls will use this at the application level.

Note: a `bundle_id` is hard coded in the application helper. Access to `bundle_id` of 1276 is required for now.

## Requirements

* Rails 4.1.4

## Usage

* Clone the application from Github: `git clone https://github.com/rparang/oracle_srm_sample_app.git`

* Run `bundle install`

* Run the WEBrick server: `rails server`

![SRM Sample app](http://f.cl.ly/items/1G0M2W041A173z1Z2S2Y/Oracle%20SRM%20Sample%20App.jpg)