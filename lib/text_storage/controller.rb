# frozen_string_literal: true

module TextStorage
  class Controller
    def initialize(file_path = File.expand_path('.text_storage.txt', __dir__))
      @file_path = file_path
    end

    def append(text)
      File.open(@file_path, 'a+') do |f|
        f.puts text
      end
    end

    def append_uniq(text)
      append text unless include? text
    end

    def include?(text)
      File.exist?(@file_path) &&
        File.open(@file_path, 'r') { |f| f.readlines(chomp: true) }.uniq.include?(text)
    end

    def read
      File.exist?(@file_path) &&
        File.open(@file_path, 'r') { |f| f.readlines(chomp: true) }
    end
    def truncate
      File.open(@file_path, 'w')
    end
  end
end
