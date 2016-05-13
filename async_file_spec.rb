require 'rspec'
require './async_file'

RSpec.describe AsyncFile, ".create" do

  before do
    Resque.inline = true
  end

  context "with valid filename" do
    let(:filename) { './tmp/rspec_test.txt' }
    subject { AsyncFile.create(filename) }

    it "create the file in resque" do
      expect{subject}.not_to raise_error
      expect(File.exist?(filename)).to be_truthy
    end
  end
end
