class CacheFile < ActiveRecord::Base
  belongs_to :cache

  def stage
    puts self.name + " is staging"
    update_column :status, 'staging'
    sleep 20
    update_column :status, 'staged'
    puts self.name + " is staged"
    update_column :url, '/cache/' + self.cache.name + '/' + self.name
  end

end
