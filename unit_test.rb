
# a typical source code structure
# roman/
#   lib/
#     roman.rb
#     other files...
#   test/
#     test_roman.rb
#     other tests...
#   other stuff...
#

require 'test/unit'

class MyTest < Test::Unit::TestCase

  def test_truth
    assert true == false
  end

  def test_coommon_sense
    assert_equal(1, 2)
  end

end