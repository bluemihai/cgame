# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Environment variables (ENV['...']) can be set in the file .env file.

Location.create(
  name: 'Clubhouse', 
  street_address: '2336 Channing Way Unit A',
  city: 'Berkeley',
  state: 'CA',
  zip: '94704'
)

descriptions = {
  "Circling" => "Authentically and\nProfoundly being with what\nArises and is",
  "T-Group" => "Practicing presence\nNow, over past and future\nFeelings, over thoughts",
  "(Blues) Dancing" => "Connecting to self\nTake your partner in your arms\nMusic touches both",
  "Give/Receive Support" => "Split time or rotate\nCounseling, massage, other\nIt’s up to your group",
  "✺ Wild Card ✺" => "Random secret game\nRevealed to those edgy souls\nWho choose it blindly"
}

wild_cards = [
  "How Do You Like To Be Kissed?",
  "Get 'Naked'",
  "Co-Create A Gift",
  "Hot Seat"
]

descriptions.each do |k, v|
  Activity.create(name: k, description: v, wild_card_weight: 0)
end

wild_cards.each do |w|
  Activity.create(name: w, wild_card_weight: 1)
end

User.create!(name: 'Mihai Banulescu', role: :host)
User.create!(name: 'David Lapedis', role: :host)

user_names = [
  'Elizabeth Masselink',
  'Guy Sengstock',
  'Breann Petree',
  'Amjad Obeidat',
  'Jeanine Becker',
  'Joel Dolowich',
  'Dion Winter',
  'Alexis Sheppard',
  'Liz Markle',
  'Steven Luibrand',
  'Blessing Horowytz',
  'Jon Cotton',
  'Marenka Cerny',
  'Val Michael Smith',
  'Tom Westin'
]

user_names.each do |name|
  User.create!(name: name, role: :player)
end
