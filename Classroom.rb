class Classroom
    attr_accessor :label
    attr_reader :Students
    def initialize(label)
        @label= label
        Students = []
    end
    def add_student(Student)
        @Students <<Student
        Student.Classroom = self unless Student.Classroom == self
    end


end