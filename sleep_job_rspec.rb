require 'rspec'
require 'mock_redis'
require './sleep_job'

RSpec.describe SleepJob, ".create" do

  before do
    Resque.redis = MockRedis.new
    Resque.inline = true
  end

  context "with valid filename" do
    subject { SleepJob.create({'length' => 10}) }

    it "create the file in resque" do
      job_id = nil
      expect{job_id = subject}.not_to raise_error
      status = Resque::Plugins::Status::Hash.get(job_id)
      expect(status).not_to be_nil
      expect(status["status"]).to be_eql('completed')
    end
  end
end
