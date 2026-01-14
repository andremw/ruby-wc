# frozen_string_literal: true

require "test_helper"
require "ruby/wc"

class Ruby::TestInputParser < Minitest::Test
  def test_it_counts_bytes_in_a_file
    assert_equal 342190, Wc.run(["-c", "test.txt"])
  end

  def test_it_counts_lines_in_a_file
    assert_equal 7145, Wc.run(["-l", "test.txt"])
  end

  def test_it_counts_words_in_a_file
    skip "todo"
  end

  def test_it_counts_characters_in_a_file
    skip "todo"
  end

  def test_it_counts_bytes_lines_and_words_in_a_file_if_no_flag_is_passed
    skip "todo"
  end
end