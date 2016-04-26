class CacheFile < ActiveRecord::Base
  belongs_to :cache
  def stage(media_file)
    sleep 5
    update_column :status, finished
  end

  def fixity(media_file)
    sleep 5
    update_column :status, finished
  end
end
