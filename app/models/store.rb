class Store < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :media_files
end
