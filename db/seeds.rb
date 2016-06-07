require 'rsolr'

# Create sample Store and Cache
store = Store.create(name: 'SDA')
cache = Cache.create(name: 'SDADisk')

# Set the place where dummy media files will be created
cache_dir = File.join(Rails.root, 'public/cache/SDADisk')

# Connect to the development Solr instance for HydraDAM app, and fetch all
# records for FileSet objects.
solr = RSolr.connect url: "http://localhost:8983/solr/hydra-development"
docs = solr.select(params: {q: "has_model_ssim:FileSet", rows: 10000})['response']['docs']

# Pare down docs to just the filename and checksum, and remove duplicates.
docs.map! do |doc|
  doc.keep_if { |key,val| key =~ /^(filename_.*|original_checksum_.*)/ }
end
docs.uniq!

# For each unique doc, insert one MediaFile record and one CacheFile record.
docs.each do |doc|
  filename = File.basename(doc['filename_tesim'].first)
  checksum = doc['original_checksum_ssim'].first
  MediaFile.create( name: filename, store_id: store.id )
  CacheFile.create( name: filename, cache_id: cache.id, checksum: checksum )
  # Copy a dummy media file into the public cache dir for each file record.
  FileUtils.cp(cache_dir + '/dummy_media_file.mp4',cache_dir + '/' + filename)
end
