# frozen_string_literal: true

require_relative "wc/version"

module Wc
  def self.run(argv, source=$stdin)
    case argv
    in ["-c"]
      { bytes: count_bytes(source) }
    in ["-c", filename]
      { bytes:
        File.open(filename) do |file|
          Wc.count_bytes(file)
        end
      }
    in ["-l"]
      { lines: count_lines(source) }
    in ["-l", filename]
      { lines:
        File.open(filename) do |file|
          Wc.count_lines(file)
        end
      }
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

  def self.count_bytes(source)
    bytes = 0
    source.each do |line|
      bytes += line.bytesize
    end
    bytes
  end

  def self.count_lines(source)
    lines = 0
    source.each do |line|
      lines += 1
    end
    lines
  end
end

