require "test/unit"

def forward(...)
  greet(...)
end

def array_expansion(*args, &block)
  greet(*args, &block)
end

def greet(str)
  greeting = "hello, #{str}"
  block_given? ? yield(greeting) : greeting
end

class ArgumentForwardingSample < Test::Unit::TestCase
  def test_forwarding
    assert_equal forward("world"), "hello, world"
  end

  def test_forwarding_with_block
    block_argument = ""
    forward("world") do |str|
      block_argument = str
    end

    assert_equal block_argument, "hello, world"
  end

  def test_array_expansion
    assert_equal array_expansion("world"), "hello, world"
  end

  def test_array_expansion_with_block
    block_argument = ""
    array_expansion("world") do |str|
      block_argument = str
    end

    assert_equal block_argument, "hello, world"
  end
end
