class Book
  attr_reader :name,
              :author_first_name,
              :author_last_name,
              :title,
              :author,
              :publication_date,
              :publication_year
  def initialize(information)
    @name = name
    @author_first_name = information[:author_first_name]
    @author_last_name = information[:author_last_name]
    @title = information[:title]
    @publication_date = information[:publication_date]
    #For the `publication_year` method, assume that the year is always the last four characters of the publication date.
    @publication_year = @publication_date[-4..-1]
    @author = "#{@author_first_name} #{@author_last_name}"
  end


end
