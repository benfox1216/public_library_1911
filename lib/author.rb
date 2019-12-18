class Author
  attr_reader :first_name, :last_name
  
  def initialize(name)
    @name = "#{name[:first_name]} #{name[:last_name]}"
    @books = []
  end
end