#!/usr/bin/env ruby
require 'resque'
require 'fileutils'

require './create_file'

class AsyncFile
  def self.create(filename)
    Resque.enqueue(CreateFile, filename)
  end
end

# filename = "./tmp/test.txt"
# AsyncFile.create(filename)
# puts "Press enter key to clean and end task"
# gets.chomp
# FileUtils.rm filename if File.exist?(filename)