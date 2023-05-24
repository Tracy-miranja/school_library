require_relative 'person_class'

class Student < Person
   attr_reader :classroom
  def initialize(age, classroom, parent_permission: true, name: 'Unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom= classroom
    classroom.add_student(self) unless classroom.Students.includes?(self)
  end
  
  def play_hooky
    '¯\(ツ)/¯'
  end
end

person1 = Person.new(23, parent_permission: true, name: 'Unknown')
puts person1.play_hooky
