require_relative 'person'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts 'Books:'
    @books.each { |book| puts book }
  end

  def list_all_people
    puts 'People:'
    @people.each { |person| puts person }
  end

  def create_person(name, age, type)
    person = type == 'teacher' ? Teacher.new(name, age) : Student.new(name, age)
    @people << person
    puts "Person created: #{person}"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Book created: #{book}"
  end

  def create_rental(book_id, person_id, due_date)
    book = @books.find { |book| book.id == book_id }
    person = @people.find { |person| person.id == person_id }

    if book.nil? || person.nil?
      puts 'Invalid book ID or person ID.'
    else
      rental = Rental.new(book, person, due_date)
      @rentals << rental
      puts "Rental created: #{rental}"
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |person| person.id == person_id }

    if person.nil?
      puts 'Invalid person ID.'
    else
      rentals = @rentals.select { |rental| rental.person == person }
      puts "Rentals for #{person.name}:"
      rentals.each { |rental| puts rental }
    end
  end
end
