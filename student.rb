require_relative 'CSVFileReader'
class Student < CSVFileReader
end

student_file = 'students.csv'
s = Student.new(student_file)
s.student_id = 10
s.student_name = "Amit"
s.teacher_name = "Shilesh"
s.subject = "Physics"
s1 = Student.find_by(student_file, "student_id", "2")
p s1.class
puts s1['student_name'] # => "kiran"
puts s1['teacher_name'] # => "manoj"

