class Library
  attr_reader :name, :books, :authors
  
  def initialize(name)
    @name = name
    @books = []
    @authors = []
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
end