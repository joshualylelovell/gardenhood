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

gardeners = []
tools = []
emails = ["joe@ga.co", "sue@ga.co", "jim@dundermifflininfinity.com", "creed@creedthoughts.creedthoughts", "me@yeah.com"]

tool_seeds = [
  {
    name: "mower",
    details: "This is a mower.",
    image: "https://snowjoecdn.azureedge.net/images/gallery_medium/iON16LM-LT-HYB-SJG-1.jpg"
  },
  {
    name: "shovel",
    details: "This is a shovel.",
    image: "http://www.tosbase.com/content/img/icons/items/icon_item_shovel.png"
  },
  {
    name: "leafblower",
    details: "This is a leafblower.",
    image: "https://snowjoecdn.azureedge.net/images/gallery_medium/SBJ605E_unit%202_6-9-2015-16-24-51.jpg"
  },
  {
    name: "posthole digger",
    details: "This is a posthole digger.",
    image: "http://sites.ararental.org/Portals/dandrental/Post%20Hole%20Digger%20Hand.jpg"
  },
  {
    name: "backhoe",
    details: "This is a backhoe.",
    image: "http://clipartsign.com/upload/2016/02/26/backhoe-free-icons-iconset-transporter-multiview-icons-by-icons-land-clip-art.png"
  }
]

5.times do |i|
  gardeners << Gardener.create!({
    email: emails[i],
    password: "test1234"
  })
  new_tool = Tool.new(tool_seeds[i])
  new_tool.gardener = gardeners[i]
  tools << new_tool.save

end


puts gardeners
puts tools
