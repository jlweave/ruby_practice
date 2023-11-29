class Author
  attr_reader :first_name,
              :last_name,
              :name,
              :books
  def initialize(information)
    @first_name = information[:first_name]
    @last_name = information[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  #The `write` method must take two Strings as arguments and return an instance of `Book`.
  #.self?, class methods lesson, book.name

  def write(name, date)
    books = []
    books.map do |book|
      Book.new(book[:name])
    end
  end
end
