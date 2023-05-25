# require_relative 'person_class'

# class Student < Person
#   attr_reader :classroom

#   def initialize(age, name, parent_permission: true)
#     super(name, age, parent_permission)
#     @classroom = nil
#   end

#   def assign_classroom(classroom)
#     @classroom = classroom
#     classroom.add_student(self) unless classroom.students.include?(self)
#   end

#   def play_hooky
#     '¯\(ツ)/¯'
#   end
# end
require_relative 'person_class'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission: true)
    super(name)
    @age = age
    @parent_permission = parent_permission
    @classroom = nil
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
