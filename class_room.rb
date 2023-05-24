class Room
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @gstudents << student
    student.classroom = self unless Student.classroom == self
  end
end
