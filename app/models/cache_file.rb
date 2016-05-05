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

  def unstage
    puts self.name + " is unstaging"
    update_column :status, 'unstaging'
    sleep 5
    update_column :status, nil
    update_column :url, nil
    puts self.name + " is now unstaged"
  end

end
