# frozen_string_literal: true
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(color: true)

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ruby/wc"

require "minitest/autorun"
