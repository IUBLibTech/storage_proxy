class AddCacheFileRefToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :cache_file
  end
end
