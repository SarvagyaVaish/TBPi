# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Role.create(:name => 'Active Member')
Role.create(:name => 'Candidate')
Role.create(:name => 'Officer')
Role.create(:name => 'Webmaster')
Role.create(:name => 'Inactive member')
Role.create(:name => 'Alumnus')

EventType.create(:name => "Meeting")
EventType.create(:name => "Social")
EventType.create(:name => "Community Service")
