require 'rails_helper'

describe 'Routes starting with /jobs/' do

  describe 'GET /jobs' do
    it 'TODO: return something useful'
  end

  describe 'GET /jobs/:id' do
    it 'TODO: return something useful'
  end

  describe 'GET /jobs/:cache_name/:cache_file_name' do
    it 'return a list of jobs for the :cache_name and :cache_file_name combination' do
      expect(get: "/jobs/foo/bar.mov").to be_routable
    end
  end

  describe 'POST /jobs/:cache_name/:cache_file_name/:job_type' do
    it 'creates a new job of :job_type for :cache_name / :cache_file_name combination'
  end
end
