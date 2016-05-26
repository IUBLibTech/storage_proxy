class AddFixityTypeToCacheFile < ActiveRecord::Migration
  def change
    add_column :cache_files, :fixity_type, :string
  end
end
