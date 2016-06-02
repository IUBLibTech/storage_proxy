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
    ["MDPI_40000000542243_01_access.mp4", 1, "d13be45c49cd966fb4a7e0bd02a757ba"],
    ["MDPI_40000000542243_01_mezz.mov", 1, "34c57239b79ed6e16a428852af1f758b"],
    ["MDPI_40000000544603_01_access.mp4", 1, "7ec0e38f7cb177e5f96c9a6add71f46f"],
    ["MDPI_40000000544603_01_mezz.mov", 1, "8a239a5849d1c1954623a9ae50fadcd8"],
    ["MDPI_40000000633687_01_access.mp4", 1, "02fd5990ebcf788ea10ce00519848996"],
    ["MDPI_40000000633687_01_mezz.mov", 1, "2b883c6be7e3d56564033e17c58e051c"],
    ["MDPI_40000000662611_01_access.mp4", 1, "f192228dcb6098c20527168064c64785"],
    ["MDPI_40000000662611_01_mezz.mov", 1, "b3ab66a879d13af31a4f5a19fc64b300"],
    ["MDPI_40000000662629_01_access.mp4", 1, "a16508a54121a1f7e5f241bf12a2fd12"],
    ["MDPI_40000000662629_01_mezz.mov", 1, "837cae3fce47e9d108ade1cae66685a8"],
    ["MDPI_40000000692030_01_access.mp4", 1, "c0727674ef2bbff08b93fe345eb0791d"],
    ["MDPI_40000000692030_01_mezz.mov", 1, "1c409c1793db0fb7776a98117f328ee1"],
    ["MDPI_40000000762320_01_access.mp4", 1, "2bd2f8693bf27246d0033beba351d2a1"],
    ["MDPI_40000000762320_01_mezz.mov", 1, "ba22421e7db1d806ae8a2e2ec35af1ce"],
    ["MDPI_40000000784936_01_access.mp4", 1, "0887039abb4e336b1a9b60e0a00763db"],
    ["MDPI_40000000784936_01_mezz.mov", 1, "06404f75ad9bc147ba85479ebc382f69"],
    ["MDPI_40000000788135_01_access.mp4", 1, "67d3514f734b2db3624d0a061bcc815a"],
    ["MDPI_40000000788135_01_mezz.mov", 1, "8d9f56bae9215f93deae5ea4dd6ecb36"],
    ["MDPI_40000000840803_01_access.mp4", 1, "2e30062533b972dc7f4268f00e2f0f4f"],
    ["MDPI_40000000840803_01_mezz.mov", 1, "d049954a2ce088b1e504a7ac8f8cf316"],
    ["MDPI_40000000922312_01_access.mp4", 1, "74a03dcf126763413ec60f77c869dec6"],
    ["MDPI_40000000922312_01_mezz.mov", 1, "0058394e827031222474ed9a491d8895"],
    ["MDPI_40000000997207_01_access.mp4", 1, "d1d2a508db444f960f7ffa0b426ead77"],
    ["MDPI_40000000997207_01_mezz.mov", 1, "3e5f2bef30111940d14e13285a8dce56"],
    ["MDPI_40000000997355_01_access.mp4", 1, "c858614a7d7673c1e01ddb3ae87dc413"],
    ["MDPI_40000000997355_01_mezz.mov", 1, "4f59479e895e4d59b6fc259bf3117e29"],
    ["MDPI_40000000997363_01_access.mp4", 1, "7822ed6f08316b2aee95dc322abe9b9d"],
    ["MDPI_40000000997363_01_mezz.mov", 1, "fa1ce250a52d1d414fe98e7807635045"],
    ["MDPI_40000000997371_01_access.mp4", 1, "ea5679648053441ca5ea9b598389535e"],
    ["MDPI_40000000997371_01_mezz.mov", 1, "acf35ccce3e24dfc9f1dbcf49942a7df"],
    ["MDPI_40000000997389_01_access.mp4", 1, "a2f08e86fdda81c543a0ed58f59ebdd5"],
    ["MDPI_40000000997389_01_mezz.mov", 1, "75098b26ee1cad2db4ef506de5e1b26b"],
    ["MDPI_40000000997397_01_access.mp4", 1, "8ce5bdf31676467f600b485d23fc1f39"],
    ["MDPI_40000000997397_01_mezz.mov", 1, "bf84c3a4d4b67ebffe0ee9ae477662d9"],
    ["MDPI_40000000997405_01_access.mp4", 1, "21f6a0a68f8965ddbfbd13abba50b5ef"],
    ["MDPI_40000000997405_01_mezz.mov", 1, "cfce1702f7271957bae788d088865efb"],
    ["MDPI_40000001106097_01_access.mp4", 1, "3435d4768797b9faa5cea3ccd90da889"],
    ["MDPI_40000001106097_01_mezz.mov", 1, "ab832d2f345de744c6edb26ea304d19f"],
    ["MDPI_40000001113838_01_access.mp4", 1, "5c4e6bc39aef1393ddbb0b44b4b0409b"],
    ["MDPI_40000001113838_01_mezz.mov", 1, "ebbb1ed8c62754562e5efa238d4f1ad3"],
    ["MDPI_40000000054496_01_access.mp4", 1, "f4c3088d835d35d8741551cf4e8977f0"],
    ["MDPI_40000000054496_01_prod.wav", 1, "7892355550c1105c0144d95ec7d3820f"],
    ["MDPI_40000000054496_01_pres.wav", 1, "a0f9e4c05b1307788734229c3023f191"],
    ["MDPI_40000000542243_01_access.mp4", 1, "d13be45c49cd966fb4a7e0bd02a757ba"],
    ["MDPI_40000000542243_01_mezz.mov", 1, "34c57239b79ed6e16a428852af1f758b"]
]

file_list.uniq.each do |name, parent_id, checksum|
  MediaFile.create( name: name, store_id: parent_id )
  CacheFile.create( name: name, cache_id: parent_id, checksum: checksum )
end


