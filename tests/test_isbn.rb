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
        assert_equal(false, funk_master("1234567"))
        assert_equal(false, funk_master("1-2-3-4-5-6-7"))
        assert_equal(false, funk_master("1 -2 -3 -4 -5 -6 -7 -"))
    end

    def test_that_10_works
        assert_equal(true, funk_master("123456789X"))
        assert_equal(true, funk_master("1- 23456  7-89x"))
        assert_equal(true, funk_master("2 22222- - 222X"))
    end

    def test_that_check_checks_out
        assert_equal(true, funk_master("0471958697"))
        assert_equal(true, funk_master("0-321-14653-0"))
        assert_equal(false, funk_master("0-321-14133-0"))
        assert_equal(false, funk_master("0-321-14133-8"))
        assert_equal(false, funk_master("0-3218"))
    end

    def test_that_teen_check_checks_out
        assert_equal(true, funk_master("9780470059029"))
        assert_equal(false, funk_master("2112322434556"))
        assert_equal(true, funk_master("978-0-13-149505-0"))
        assert_equal(true, funk_master("978 0 471 48648 0"))
        assert_equal(false, funk_master("100 -200 43  221-2 2"))
    end
end