class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
