require './lib/book'

class Author
  attr_reader :name, :books
  
  def initialize(name)
    @name = "#{name[:first_name]} #{name[:last_name]}"
    @books = []
  end
  
  def write(title, publication_date)
    new_book = Book.new({title: title, publication_date: publication_date})
    
    @books << new_book
    
    new_book
  end
end