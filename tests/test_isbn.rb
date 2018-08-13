require "minitest/autorun"
require_relative "../isbn.rb"

class TestIsbn < Minitest::Test

    def test_assert_that_1_equals_1
        assert_equal(1, 1)
    end

    def test_that_random_dash_is_removed
        assert_equal("12345", isbn_dash("1-2-3-4-5"))
        assert_equal("12345", isbn_dash("1 - 23-4 5"))
        assert_equal("12345", isbn_dash("1  -  2  -  3  -  4  -  5"))
    end

    def test_that_length_checker_works
        assert_equal(false, length_checker("1234567"))
        assert_equal(false, length_checker("1-2-3-4-5-6-7"))
        assert_equal(false, length_checker("1 -2 -3 -4 -5 -6 -7 -"))
    end
end