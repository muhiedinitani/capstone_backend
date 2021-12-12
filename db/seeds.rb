# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

skimap_index = JSON.parse(File.read(Rails.root.join('db/skimapindex.json')))
skimap = skimap_index["skiAreas"]["skiArea"]

skimap.each do |i|
  resort = Resort.new(
    name: i["name"]["__cdata"], # name; working
    official_website: i["officialWebsite"] && i["officialWebsite"]["__cdata"], # website; working
    lat: i["georeferencing"]["_lat"].to_f, #lat; working
    lng: i["georeferencing"]["_lng"].to_f, #lng; working
    region_id: i["regions"]["region"][0]["_id"].to_i, # region_id; working
    region_name: i["regions"]["region"][0]["__cdata"], #region_name; working
    original_id: i["_id"].to_i #original_id; working
  )
  resort.save
end

# fix this later with resorts that aren't migrating