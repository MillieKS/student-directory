# first we put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
# we print the list of students with methods
def print_header
  puts "The students of Villian Academy"
  puts "-------------"
end
# Modify your program to only print the students 
# whose name begins with a specific letter.
def print_char(arr)
  arr.each do |x|
    if x[:name].start_with?("s")
      puts "My name is #{x[:name]}, it starts with an S for Super!" 
    end
  end
end

def print(arr)
  arr.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"  
  end
end

# finally, we print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
  
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end 

students = input_students
print_header
# print(students)
# print_footer(students)
print_char(students)