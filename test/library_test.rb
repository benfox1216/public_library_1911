require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
  end
  
  def test_it_exists
    assert_instance_of Library, @dpl
  end
  
  def test_it_has_attributes
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end
end