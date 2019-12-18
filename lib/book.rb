class Book
  attr_reader :author, :title, :publication_date
  
  def initialize(book_info)
    @author = "#{book_info[:author_first_name]} #{book_info[:author_last_name]}"
    @title = book_info[:title]
    @publication_date = book_info[:publication_date]
  end
end