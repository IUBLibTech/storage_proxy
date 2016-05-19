class Job < ActiveRecord::Base

  TYPES = {
    stage: 'stage',
    unstage: 'unstage',
    fixity: 'fixity'
  }
  
  STATUSES = {
    in_progress: 'in progress',
    complete: 'complete'
  }

  belongs_to :cache

  validates :cache, presence: true
  validates :job_type, inclusion: { in: TYPES.values }
  validates :status, inclusion: { in: STATUSES.values }

  def as_json(options={})
    {
      id: id,
      cache: cache.name,
      file: cache_file_name,
      dateCreated: created_at,
      type: job_type,
      status: status
    }
  end
end
