class CacheFile < ActiveRecord::Base
  belongs_to :cache

  def stage
    unless self.status == 'staging' || self.status == 'staged' || self.status == 'calculating'
      puts self.name + " is staging"
      update_column :status, 'staging'
      sleep 10
    end
    update_column :status, 'staged'
    puts self.name + " is staged"
    update_column :url, 'http://hydradam.dlib.indiana.edu/cache/' + self.cache.name + '/' + self.name
  end

  def unstage
    puts self.name + " is unstaging"
    update_column :status, 'unstaging'
    sleep 5
    update_column :fixity_available, false
    update_column :status, nil
    update_column :fixity_type, nil
    update_column :fixity_date, nil
    update_column :url, nil
    puts self.name + " is now unstaged"
  end

  def fixity(fixity_type)
    unless self.status == 'calculating'
      self.stage
      puts self.name + " is calculating checksum"
      update_column :status, 'calculating checksum'
      sleep 10
      update_column :fixity_available, true
      update_column :fixity_date, Time.now
      update_column :fixity_type, fixity_type
      update_column :status, 'staged'
      puts self.name + " is now staged with checksum"
    end
  end

end
