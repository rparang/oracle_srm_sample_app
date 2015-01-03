# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

default_app = SrmApp.create(
  name: "SRM Demo",
  app_id: "62e8dde6a239078ce9b662a73381b28da31e84f7da98f6a8990ac7bb80c6bbc5", 
  app_secret: "1ac9522716dcb4cfd702e7ce5454beeb224e2b259f8f326cf04602ca50a2e747")

default_bundle = SrmBundle.create(name: "Global", bundle_id: 4349)