# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running seeds!"

Tool.delete_all()
Gardener.delete_all()

gardeners = Gardener.create!([
  {
    email: "joe@ga.co",
    password: "test1234"
  }
])

puts gardeners

tools = Tool.create!([
  {
    name: "mower",
    details: "Old school push mower",
    gardener: gardeners[0]
  }
])

puts tools
