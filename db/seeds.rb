# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Store.create(name: 'SDA')
Cache.create(name: 'SDADisk')


file_list = [
    ["MDPI_40000000054496_01_access.mp4", 1],
    ["MDPI_40000000613028_01_access.mp4", 1],
    ["MDPI_40000000054496_01_pres.wav", 1],
    ["MDPI_40000000613028_01_pres.wav", 1],
    ["MDPI_40000000054496_01_prod.wav", 1],
    ["MDPI_40000000613028_01_prod.wav", 1],
    ["MDPI_40000000300048_01_access.mp4", 1],
    ["MDPI_40000000613036_01_access.mp4", 1],
    ["MDPI_40000000300048_01_mezz.mov", 1],
    ["MDPI_40000000613036_01_pres.wav", 1],
    ["MDPI_40000000300048_01_pres.mkv", 1],
    ["MDPI_40000000613036_01_prod.wav", 1],
    ["MDPI_40000000543944_01_access.mp4", 1],
    ["MDPI_40000000692030_01_access.mp4", 1],
    ["MDPI_40000000543944_01_pres.wav", 1],
    ["MDPI_40000000692030_01_mezz.mov", 1],
    ["MDPI_40000000543944_01_prod.wav", 1],
    ["MDPI_40000000692030_01_pres.mkv", 1],
    ["MDPI_40000000543951_01_access.mp4", 1],
    ["MDPI_40000001192451_01_access.mp4", 1],
    ["MDPI_40000000543951_01_pres.wav", 1],
    ["MDPI_40000001192451_01_pres.wav", 1],
    ["MDPI_40000000543951_01_prod.wav", 1],
    ["MDPI_40000001192451_01_prod.wav", 1],
    ["MDPI_40000000577553_01_access.mp4", 1],
    ["MDPI_40000001192451_02_access.mp4", 1],
    ["MDPI_40000000577553_01_pres.wav", 1],
    ["MDPI_40000001192451_02_pres.wav", 1],
    ["MDPI_40000000577553_01_prod.wav", 1],
    ["MDPI_40000001192451_02_prod.wav", 1],
    ["MDPI_40000000577553_02_access.mp4", 1],
    ["MDPI_40000001229337_01_access.mp4", 1],
    ["MDPI_40000000577553_02_pres.wav", 1],
    ["MDPI_40000001229337_01_pres.wav", 1],
    ["MDPI_40000000577553_02_prod.wav", 1],
    ["MDPI_40000001229337_01_prod.wav", 1],
    ["MDPI_40000000613010_01_access.mp4", 1],
    ["MDPI_40000001229337_02_access.mp4", 1],
    ["MDPI_40000000613010_01_pres.wav", 1],
    ["MDPI_40000001229337_02_pres.wav", 1],
    ["MDPI_40000000613010_01_prod.wav", 1],
    ["MDPI_40000001229337_02_prod.wav", 1]
]

file_list.each do |name, parent_id|
  MediaFile.create( name: name, store_id: parent_id )
  CacheFile.create( name: name, cache_id: parent_id )
end

