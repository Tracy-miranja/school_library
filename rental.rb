class Rental
    attr_accessor :date
    attr_reader :book
    def initialize(date)
        @date=date
    end

    def book=(book)
        @book = book
        book.add_rental(self) unless rental.book includes?(self)

end