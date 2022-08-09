student_count = 11
# first we put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# we print the list of students
puts "The students of Villian Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally, we print the total number of students
print "Overall, we have #{students.count} great students"
# it's important that print() doesn't add new line characters
