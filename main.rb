require_relative 'app'

def main
  app = App.new

  puts 'Welcome to the Library App!'

  loop do
    puts "\nPlease choose an option:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_person_prompt
    when 4
      app.create_book_prompt
    when 5
      app.create_rental_prompt
    when 6
      app.list_rentals_for_person_prompt
    when 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end

main
