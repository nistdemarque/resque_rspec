require 'resque-status'

class SleepJob
  include Resque::Plugins::Status

  def perform
    total = (options['length'] || 1000).to_i
    total.times do |i|
      num = i+1
      at(num, total, "At #{num} of #{total}")
      sleep(1)
    end
  end
end

# job_id = SleepJob.create(length: 100)
# status = Resque::Plugins::Status::Hash.get(job_id)
# p status