class Cache < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :cache_files
end
