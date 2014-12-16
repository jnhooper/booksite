# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name:'admin', email:'nisse038@gmail.com', isAdmin:true, password:'asdf')
Author.create(first_name:"anonymous", bio:"Not much is known about this author")
Author.create(first_name:"Jim", last_name:"Jeffry", bio:"Not much is known about this author")