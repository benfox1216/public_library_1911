class Library
  attr_reader :name, :books, :authors, :checked_out_books
  
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end
  
  def add_author(author)
    @authors << author
    
    author.books.each {|book| @books << book}
  end
  
  def publication_time_frame_for(author)
    publication_dates = author.books.map do |book|
      book.publication_year
    end

    publication_time_frame = Hash.new
    
    publication_time_frame[:start] = publication_dates.min
    publication_time_frame[:end] = publication_dates.max
    
    publication_time_frame
  end
  
  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      true
    else
      false
    end
  end
  
  def return(book)
    @checked_out_books.delete(book)
  end
end