require_relative './person_class'
require_relative './book'
require_relative './rental'
require_relative './teacher_class'
require_relative './student_class'

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

  def create_person_prompt
    puts 'Enter person name:'
    name = gets.chomp

    puts 'Enter person age:'
    age = gets.chomp.to_i

    puts 'Enter person type (teacher or student):'
    type = gets.chomp

    create_person(name, age, type)
  end

  def create_person(name, age, type)
    person = type == 'teacher' ? Teacher.new(name, age) : Student.new(name, age)
    @people << person
    puts "Person created: #{person}"
  end

  def create_book_prompt
    puts 'Enter book title:'
    title = gets.chomp

    puts 'Enter book author:'
    author = gets.chomp

    create_book(title, author)
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "Book created: #{book}"
  end

  def create_rental_prompt
    puts 'Enter book ID:'
    book_id = gets.chomp.to_i

    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    puts 'Enter due date:'
    due_date = gets.chomp

    create_rental(book_id, person_id, due_date)
  end

  def create_rental(book_id, person_id, due_date)
    found_book = @books.find { |book| book.id == book_id }
    found_person = @people.find { |person| person.id == person_id }

    if found_book.nil? || found_person.nil?
      puts 'Invalid book ID or person ID.'
    else
      rental = Rental.new(found_book, found_person, due_date)
      @rentals << rental
      puts "Rental created: #{rental}"
    end
  end

  def list_rentals_for_person_prompt
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    list_rentals_for_person(person_id)
  end

  def list_rentals_for_person(person_id)
    found_person = @people.find { |person| person.id == person_id }

    if found_person.nil?
      puts 'Invalid person ID.'
    else
      rentals = @rentals.select { |rental| rental.person == found_person }
      puts "Rentals for #{found_person.name}:"
      rentals.each { |rental| puts rental }
    end
  end
end
