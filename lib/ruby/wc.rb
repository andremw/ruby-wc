# frozen_string_literal: true

require_relative "wc/version"

module Wc
  def self.run(argv)
    case argv
    in ["-c", filename]
      content = File.read(filename)
      { bytes: content.bytesize }
    in ["-l", filename]
      content = File.read(filename)
      { lines: content.split("\n").length }
    in ["-w", filename]
      content = File.read(filename)
      { words: content.split(" ").length }
    in ["-m", filename]
      content = File.read(filename)
      { characters: content.split("").length }
    end
  end
end

