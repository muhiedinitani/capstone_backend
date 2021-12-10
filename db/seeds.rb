# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

skimap_index = JSON.parse(File.read(Rails.root.join('db/skimapindex.json')))
skimap = skimap_index["skiAreas"]["skiArea"][0]

# p skimap["name"]["__cdata"] # name; working
# p skimap["officialWebsite"]["__cdata"] # website; working
# p skimap["georeferencing"]["_lat"].to_f #lat; working
# p skimap["georeferencing"]["_lng"].to_f #lng; working
p skimap["regions"]["region"][0]["_id"].to_i # region_id; working
p skimap["regions"]["region"][0]["__cdata"] #region_name; working
# p skimap["_id"].to_i #original_id; working