class Rental
    attr_accessor :date
    attr_reader :book, :person
    def initialize(date,book,person)
        @date=date
        @book=book
        @person = nil
    end

    def book=(book)
        @book = book
        book.add_rental(self) unless rental.book includes?(self)
    end

    def

end