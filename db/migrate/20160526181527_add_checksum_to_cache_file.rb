class AddChecksumToCacheFile < ActiveRecord::Migration
  def change
    add_column :cache_files, :checksum, :string
    add_column :cache_files, :fixity_available, :boolean
    add_column :cache_files, :fixity_date, :datetime
  end
end
