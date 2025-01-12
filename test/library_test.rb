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
  
  def test_it_can_add_authors
    @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857")
    villette = @charlotte_bronte.write("Villette", "1853")
    @dpl.add_author(@charlotte_bronte)
    
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_author(@harper_lee)
    
    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
  end
  
  def test_adding_authors_also_adds_their_books
    @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857")
    villette = @charlotte_bronte.write("Villette", "1853")
    @dpl.add_author(@charlotte_bronte)
    
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_author(@harper_lee)
    
    assert_instance_of Book, @dpl.books[3]
  end
  
  def test_it_can_give_publication_time_frame
    @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857")
    villette = @charlotte_bronte.write("Villette", "1853")
    @dpl.add_author(@charlotte_bronte)
    
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_author(@harper_lee)
    
    publication_dates = {:start=>"1847", :end=>"1857"}
    
    assert_equal publication_dates, @dpl.publication_time_frame_for(@charlotte_bronte)
  end
  
  def test_you_can_checkout_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")
    
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    
    assert_equal false, @dpl.checkout(mockingbird)
    assert_equal false, @dpl.checkout(jane_eyre)
    
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal true, @dpl.checkout(jane_eyre)
    @dpl.checkout(jane_eyre)
    assert_equal [jane_eyre], @dpl.checked_out_books
    
    assert_equal false, @dpl.checkout(jane_eyre)
    @dpl.checkout(jane_eyre)
    assert_equal [jane_eyre], @dpl.checked_out_books
  end
  
  def test_you_can_return_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")
    
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)
    @dpl.checkout(jane_eyre)
    
    assert_equal [jane_eyre], @dpl.checked_out_books
    
    @dpl.return(jane_eyre)
    
    assert_equal [], @dpl.checked_out_books
  end
end