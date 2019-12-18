require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
    
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
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