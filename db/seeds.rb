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

EventType.create(:name => "Meeting")
EventType.create(:name => "Social")
EventType.create(:name => "Community Service")

Semester.create(:name => "Fall 2012", :start_dt => Time.local(2012, 8, 20), :end_dt => Time.local(2012, 12, 7))

Member.create(:first_name => "TBPi Admin", :last_name => "(Gatech)", :gtid => "100944813303637178686", :gtusername => "100944813303637178686", :role_id => 4)
