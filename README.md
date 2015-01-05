# Oracle Social Relationship Management (SRM) API Example

This app is a barebones Ruby on Rails application that gives an example how to authenticate and use SRM's public API.

For this application to work for you, you will need the following:
* An SRM account login
* An SRM bundle that includes Engage messages

To keep the app simple, all it does it show a list of messages that are tied to a given SRM bundle. An SRM bundle is a collection of resources (e.g. Facebook pages or Twitter accounts) hosted on your SRM account. If you don't have one of your own, you can also request to get access to an existing one. This app comes pre-populated with two SRM bundles for your use as examples, but you can add/remove them easily.

In order to authenticate the application with your SRM account, it will use OAuth to obtain an authentication token. In typical OAuth implementations, it's likely your application will have user models and there will be some association of access tokens to these users. For example, you will have a `users` table and an `authentications` table, and a record in the `authentications` table will correspond to a user.

This application does store its authorization tokens inside the `srm_authorizations` table, but they are all tied to the same 'user', and mapped to a certain `srm_app`. There is a single SRM App that is provided in the code as the 'default' application. Feel free to use this one, or override it with your own (by deleting or updating the SRM App in the db, created by your seeds).

To create the initial SRM App and SRM Bundles, you need to run `rake db:seed`, as suggested in the setup instructions.

## Requirements

* Ruby (1.9.3 or above)

* Rails 4.1.4

## Usage

* Clone the application from Github: `git clone https://github.com/rparang/oracle_srm_sample_app.git`

* Run `bundle install`

* Run 'rake db:migrate'

* Run 'rake db:seed'

* Run the Puma server: `rails s`

Once you've completed the steps above, and ensured your account has access to a bundle with messags, and selected that bundle, you should see something like this:

![SRM Sample app](http://note.io/17dRh5g)

Here is a screencast demonstrating the application functionality:

[SRM Sample App Demo Screencast](http://quick.as/oo7ltaq4)