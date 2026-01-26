# frozen_string_literal: true

require_relative "wc/version"

module Wc
  def self.run(argv, source=$stdin)
    case argv
    in ["-c"]
      source.reduce({ bytes: 0 }, &Wc.method(:count_bytes))
    in ["-c", filename]
      File.open(filename).reduce({ bytes: 0 }, &Wc.method(:count_bytes))
    in ["-l"]
      source.reduce({ lines: 0 }, &Wc.method(:count_lines))
    in ["-l", filename]
      File.open(filename).reduce({ lines: 0 }, &Wc.method(:count_lines))
    in ["-w"]
      { words: count_words(source) }
    in ["-w", filename]
      { words:
        File.open(filename, encoding: "UTF-8") do |file|
          Wc.count_words(file)
        end
      }
    in ["-m"]
      { characters: count_characters(source) }
    in ["-m", filename]
      { characters:
        File.open(filename, encoding: "UTF-8") do |file|
          Wc.count_characters(file)
        end
      }
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

  def self.count_bytes(acc, line)
    acc.merge({ bytes: acc[:bytes] + line.bytesize })
  end

  def self.count_lines(acc, line)
    acc.merge({ lines: acc[:lines] + 1})
  end

  def self.count_words(source)
    words = 0
    source.each do |line|
      words += line.split(" ").length
    end
    words
  end

  def self.count_characters(source)
    characters = 0
    source.each do |line|
      characters += line.split("").length
    end
    characters
  end
end

