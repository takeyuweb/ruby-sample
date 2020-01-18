require "test/unit"

class KeywordArgumentsSample < Test::Unit::TestCase
  def test_without_numbered_parameters
    array = [1, 2, 3]
    assert_equal array.inject(0) { |memo, v| memo + v }, 6
  end

  def test_with_numbered_parameters
    array = [1, 2, 3]
    assert_equal array.inject(0) { _1 + _2 }, 6
  end
end
