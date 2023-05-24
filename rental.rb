class Rental
    attr_accessor :date
    attr_reader :book, :person
    def initialize(date,book,person)
        @date=date
        @book=book
        @person = person
        @rentals = []
    end

    def add_rentals(rental)
        @rentals <<rental
        rental.person=self
    end

    def remove_rental(rental)
        rentals.delete(rental)
        rental.person = nil
      end

    def book=(book)
        @book = book
        book.add_rental(self) unless rental.book includes?(self)
    end

end