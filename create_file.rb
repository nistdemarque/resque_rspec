class CreateFile
  @queue = :resque_test

  def self.perform(filename)
    File.open(filename, 'w') { |file|
      file.puts "Writing async file."
    }
  end
end