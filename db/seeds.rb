# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


CSV.foreach("db/KEN_ALL.CSV", encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[6]
  cityName = row[7]
  pref = Pref.find_or_create_by(:name => prefName)
  City.find_or_create_by(:name => cityName, pref_id: pref.id)
end