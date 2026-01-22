# frozen_string_literal: true

require "test_helper"
require "ruby/wc"

class Ruby::TestInputParser < Minitest::Test
  def test_it_counts_bytes_in_a_file
    exp = { bytes: 342190 }
    assert_equal exp, Wc.run(["-c", "test.txt"])
  end

  def test_it_counts_lines_in_a_file
    exp = { lines: 7145 }
    assert_equal exp, Wc.run(["-l", "test.txt"])
  end

  def test_it_counts_words_in_a_file
    exp = { words: 58164 }
    assert_equal exp, Wc.run(["-w", "test.txt"])
  end

  def test_it_counts_characters_in_a_file
    exp = { characters: 339292 }
    assert_equal exp, Wc.run(["-m", "test.txt"])
  end

  def test_it_counts_bytes_lines_and_words_in_a_file_if_no_flag_is_passed
    exp = { bytes: 342190, lines: 7145, words: 58164 }
    assert_equal exp, Wc.run(["test.txt"])
  end

  def test_it_counts_bytes_from_stdin
    fake_stdin = StringIO.new("hello world")

    exp = { bytes: 11 }
    assert_equal exp, Wc.run(["-c"], fake_stdin)
  end

  def test_it_counts_lines_from_stdin
    fake_stdin = StringIO.new("hello\nworld")

    exp = { lines: 2 }
    assert_equal exp, Wc.run(["-l"], fake_stdin)
  end

  def test_it_counts_words_from_stdin
    fake_stdin = StringIO.new("hello world")

    exp = { words: 2 }
    assert_equal exp, Wc.run(["-w"], fake_stdin)
  end

  def test_it_counts_characters_from_stdin
    fake_stdin = StringIO.new("hello world")

    exp = { characters: 11 }
    assert_equal exp, Wc.run(["-m"], fake_stdin)
  end

  def test_it_accepts_the_valid_flags_in_any_order
    skip "todo"
  end
end