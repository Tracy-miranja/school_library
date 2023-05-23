require_relative './namable_class.rb'
require_relative './base_decorator.rb'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @parent_permission = parent_permission
    super() 
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name 
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'tracy')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name