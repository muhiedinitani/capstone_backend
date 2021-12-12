# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

skimap_index = JSON.parse(File.read(Rails.root.join('db/skimapindex.json')))
skimap = skimap_index["skiAreas"]["skiArea"][0]

x = Resort.new(
  name: skimap["name"]["__cdata"], # name; working
  official_website: skimap["officialWebsite"]["__cdata"], # website; working
  lat: skimap["georeferencing"]["_lat"].to_f, #lat; working
  lng: skimap["georeferencing"]["_lng"].to_f, #lng; working
  region_id: skimap["regions"]["region"][0]["_id"].to_i, # region_id; working
  region_name: skimap["regions"]["region"][0]["__cdata"], #region_name; working
  original_id: skimap["_id"].to_i #original_id; working
)

x.save

#continue here, you got it to work on one resort. just have it go thru the entire json with an .each do. need to speed things up. once you have your db of resorts, your backend is pretty much complete. no need to have a resort create for time being. 




# skimap.each do |resort|
#   Resort.new(
#     name: resort["name"]["__cdata"], # name; working
#     offical_website: resort["officialWebsite"]["__cdata"], # website; working
#     lat: resort["georeferencing"]["_lat"].to_f, #lat; working
#     lng: resort["georeferencing"]["_lng"].to_f, #lng; working
#     region_id: resort["regions"]["region"][0]["_id"].to_i, # region_id; working
#     region_name: resort["regions"]["region"][0]["__cdata"], #region_name; working
#     original_id: resort["_id"].to_i #original_id; working
#   )
#   Resort.save
# end