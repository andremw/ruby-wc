# frozen_string_literal: true

require_relative "wc/version"

module Wc
  def self.run(argv)
    case argv
    in ["-c", filename]
      content = File.read(filename)
      content.bytesize
    in ["-l", filename]
      content = File.read(filename)
      content.split("\n").length
    in ["-w", filename]
      content = File.read(filename)
      content.split(" ").length
    end
  end
end

