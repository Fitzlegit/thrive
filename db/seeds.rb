# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_groups
  Group.create(name: 'Thrive')
  Group.create(name: 'Pain Is Life')
  Group.create(name: 'Brush')
  Group.create(name: 'Pathfinder')
end

def seed_users
  User.create(email: 'johnd@email.com', password: 'password', first_name: 'John', last_name: 'Doe')
  User.create(email: 'adelea@email.com', password: 'password', first_name: 'Adele', last_name: 'Adkins')
  User.create(email: 'jimih@email.com', password: 'password', first_name: 'Jimi', last_name: 'Hendrix')
  User.create(email: 'bos@email.com', password: 'password', first_name: 'Bobby', last_name: 'Simmons')
  User.create(email: 'andre3000@email.com', password: 'password', first_name: 'Andre', last_name: 'Benjamin')
end

#assign groups to users at random
#User.all.collect do |user|
  #user.groups << Group.all.sample
#  user.save
#end

#assign membership type at random
#Membership.all.collect do |members|
  #type = ["Instructor", "Student"]
  #members.status = type.sample
  #members.save
#end

seed_groups
seed_users
