require_relative './namable_class'
require_relative './base_decorator'
require_relative './trimer_decorator'
require_relative './capitalize_decorate'
require_relative './rental'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def remove_rental(rental)
    rentals.delete(rental)
    rental.person = nil
  end

  private

  def of_age?
    @age >= 18
  end
end
