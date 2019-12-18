class Library
  attr_reader :name
  
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end
end