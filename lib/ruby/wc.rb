# frozen_string_literal: true

require_relative "wc/version"

module Wc
  def self.run(argv)
    case argv
    in ["-c", filename]
      bytes = 0
      File.foreach(filename) do |line|
        bytes += line.bytesize
      end
      { bytes: }
    in ["-l", filename]
      lines = 0
      File.foreach(filename) do |line|
        lines += 1
      end
      { lines: }
    in ["-w", filename]
      words = 0
      File.foreach(filename, encoding: "UTF-8") do |line|
        words += line.split(" ").length
      end
      { words: }
    in ["-m", filename]
      characters = 0
      File.foreach(filename, encoding: "UTF-8") do |line|
        characters += line.split("").length
      end
      { characters: }
    in [filename]
      bytes = 0
      lines = 0
      words = 0
      File.foreach(filename, encoding: "UTF-8") do |line|
        bytes += line.bytesize
        lines += 1
        words += line.split(" ").length
      end
      {
        bytes:,
        lines:,
        words:,
      }
    end
  end
end

