class Cache < ActiveRecord::Base
  has_many :cache_files
  has_many :jobs
end
