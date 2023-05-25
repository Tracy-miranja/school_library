require_relative './app'

def print_menu
  puts "\nPlease choose an option:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts '7. Quit'
end
def create_person(app)
  puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:-'
  option = gets.chomp
  parent_permission = true
  puts 'age:-'
  age = gets.chomp.to_i
  puts 'name:-'
  name = gets.chomp
  puts 'Has parent permission?[Y/N]'
  val = gets.chomp
  parent_permission = false if %w[N n NO no No].include?(val)

  case option.to_i
  when 1
    app.create_student(age, name, parent_permission)
  when 2
    puts 'specialization:-'
    specialization = gets.chomp
    app.create_teacher(age, specialization, name, parent_permission)
  else
    puts 'Invalid input ):'
  end
end

def handle_choice(choice, app)
    choice_actions = {
      1 => :list_all_books,
      2 => :list_all_people,
      3 => :create_person,
      4 => :create_book_prompt,
      5 => :create_rental_prompt,
      6 => :list_rentals_for_person_prompt,
      7 => :quit
    }
  
    action = choice_actions[choice]
  
    if action
      if action == :create_person
        create_person(app)  # Pass the `app` argument
      else
        app.send(action)
      end
    else
      puts 'Invalid choice. Please try again.'
    end
  end
  

def main
  app = App.new

  puts 'Welcome to the Library App!'

  loop do
    print_menu
    choice = gets.chomp.to_i

    handle_choice(choice, app)

    break if choice == 7
  end

  puts 'Goodbye!'
end

main
