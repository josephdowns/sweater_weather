class Book
  attr_reader :title, :publisher, :isbn, :author, :publish_year

  def initialize(data)
    @title = data[:title]
    @publisher = data[:publisher]
    @isbn = data[:isbn]
    @author = data[:author_name]
    @publish_year = data[:publish_year]
  end
end
