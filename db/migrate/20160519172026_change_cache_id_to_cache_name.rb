class ChangeCacheIdToCacheName < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.remove :cache_file_id
      t.references :cache
      t.string :cache_file_name
    end
  end
end
