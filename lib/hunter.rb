require "hunter/version"
require 'zlib'

module Hunter

  class Hunt

    attr_accessor :string_to_match

    def initialize(string_to_match)
      @string_to_match = string_to_match
    end

    # ONE FILE
    def look_in(file)
      counter = 0
      File.open(file, "r") do |infile|
        while line = infile.gets
          counter += 1 if look_for_match(line)
        end
      end
      puts counter
      counter
    end

    # ONE .GZ FILE
    def look_in_archived(file)
      counter = 0
      File.open(file) do |f|
        gz = Zlib::GzipReader.new(f)
        gz.each_line do |line|
          counter += 1 if look_for_match(line)
        end
        gz.close
      end
      puts counter
      counter
    end

    # ARCHIVE OF .GZ FILES
    def look_through_archive(directory, file_basename = "*", compression = "gz")
      counter = 0
      files = Dir.glob("/#{directory}/#{file_basename}.*.#{compression}")
      files = sort_archive(files)

      files.each do |file|
        matches = look_in_archived(file)
        counter += matches
        puts "#{file}: #{matches}"
      end

      puts "TOTAL: " + counter.to_s
      counter
    end


    # HELPERS
    def look_for_match(line)
      true if line.include? @string_to_match
    end

    def sort_archive(files)
      r = Regexp.new(".([0-9]+).gz")
      sorted_files = files.sort do |f1, f2|
        n1 = r.match(f1)[1].to_i
        n2 = r.match(f2)[1].to_i
        n1 <=> n2
      end
      sorted_files
    end

  end

end
