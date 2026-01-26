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
      source.reduce({ words: 0 }, &Wc.method(:count_words))
    in ["-w", filename]
      File.open(filename, encoding: "UTF-8").reduce({ words: 0 }, &Wc.method(:count_words))
    in ["-m"]
      source.reduce({ characters: 0 }, &Wc.method(:count_characters))
    in ["-m", filename]
      File.open(filename, encoding: "UTF-8").reduce({ characters: 0 }, &Wc.method(:count_characters))
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

  def self.count_words(acc, line)
    acc.merge({ words: acc[:words] + line.split(" ").length})
  end

  def self.count_characters(acc, line)
    acc.merge({ characters: acc[:characters] + line.split("").length})
  end
end

