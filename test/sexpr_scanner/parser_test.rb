require 'test_helper'

module SexprScanner
  class TestParser < Minitest::Test
    def assert_parsed(expected, actual)
      assert_equal(expected, Parser.new(actual).parse!)
    end

    def test_items
      assert_parsed [:test], "(test)"
      assert_parsed [:def, :test2], "(def test2)"
    end

    def test_nested_items
      assert_parsed [:test, [:test2, :test3]], "(test (test2 test3))"
      assert_parsed [:test, [:test2, [:test3]]], "(test (test2 (test3)))"
    end

    def test_integers
      assert_parsed [1, 2], "(1 2)"
      assert_parsed [-1, -2], "(-1 -2)"
    end

    def test_strings
      assert_parsed ["test", "string"], '("test" "string")'
    end

    def test_special_charactars
      assert_parsed [:+, 1, 2], "(+ 1 2)"
      assert_parsed [:-, 1, 2], "(- 1 2)"
      assert_parsed [:eql?, 1, 2], "(eql? 1 2)"
    end
  end
end
