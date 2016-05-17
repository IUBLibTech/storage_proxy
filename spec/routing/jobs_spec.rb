require 'rails_helper'

describe 'Routes starting with /jobs/' do
  let(:fake_job_id) { "abc123" }

  describe 'GET /jobs' do
    it 'is routable' do
      expect(get: '/jobs').to be_routable
    end
  end
  describe 'GET /jobs/:id' do
    it 'is routable' do
      expect(get: "/jobs/#{fake_job_id}").to be_routable
    end
  end

  describe 'POST /jobs' do
    it 'is routable' do
      expect(post: "/jobs").to be_routable
    end
  end

  # TODO: Why do we need a separate URL to get the "final" status
  # when GET /jobs/:id will give you the "current" status?
  describe 'GET /jobs/:id/output' do
    it 'is routable' do
      expect(get: "/jobs/#{fake_job_id}/output").to be_routable
    end
  end
end
