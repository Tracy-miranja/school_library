class Book
    attr_accessor :title, :author
    attr_reader :rentals
    def initialize(title,author)
        @title = title
        @author = author
        rentals =[]
    end

    def add_rental(rental)
        @retals<< rental
        rental.book = self unless book.rental == self
    end

    def remove_rental(rental)
        rentals.delete(rental)
      end
end