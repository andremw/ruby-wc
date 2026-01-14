# frozen_string_literal: true

require "test_helper"
require "ruby/wc/input_parser"

class Ruby::TestInputParser < Minitest::Test
  def test_it_parses_the_c_flag
    assert_equal InputParser.parse('-c test.txt'), { flag: '-c', filename: 'test.txt' }
  end

  def test_it_parses_the_l_flag
    skip "todo"
  end

  def test_it_parses_the_w_flag
    skip "todo"
  end

  def test_it_parses_the_m_flag
    skip "todo"
  end
end
