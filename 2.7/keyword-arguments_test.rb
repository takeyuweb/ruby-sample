require "test/unit"

def area(x:, y:)
  x * y
end

class KeywordArgumentsSample < Test::Unit::TestCase
  def test_ruby2_kwargs
    opts = {
      x: 10,
      y: 20
    }
    # keyword-arguments_test.rb:13: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
    assert_equal area(opts), 200
  end

  def test_ruby3_kwargs
    opts = {
      x: 10,
      y: 20
    }
    assert_equal area(**opts), 200
  end
end
