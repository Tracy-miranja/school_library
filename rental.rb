class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, _person)
    @date = date
    @book = book
    @person = nil
  end
end
