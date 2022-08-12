@width = 50
# first we put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, DOB: "10/11/66", hobbies: "Tennis"},
  {name: "Darth Vader", cohort: :november, DOB: "01/12/76", hobbies: "Painting"},
  {name: "Nurse Ratched", cohort: :november, DOB: "16/01/54", hobbies: "Singing"},
  {name: "Michael Corleone", cohort: :november, DOB: "09/07/81", hobbies: "Reading"},
  {name: "Alex DeLarge", cohort: :november, DOB: "01/12/98", hobbies: "Watching TV"},
  {name: "The Wicked Witch of the West", cohort: :november, DOB: "31/12/79", hobbies: "Painting"},
  {name: "Terminator", cohort: :november, DOB: "08/04/83", hobbies: "Gaming"},
  {name: "Freddy Krueger", cohort: :november, DOB: "22/03/72", hobbies: "Running"},
  {name: "The Joker", cohort: :november, DOB: "14/11/98", hobbies: "Shopping"},
  {name: "Joffrey Baratheon", cohort: :november, DOB: "24/06/92", hobbies: "Photography"},
  {name: "Norman Bates", cohort: :november, DOB: "01/01/68", hobbies: "Cooking"}
]
# we print the list of students with methods
def print_header
  puts "The students of Villian Academy".center(@width)
  puts "-------------"
end
# Modify your program to only print the students 
# whose name begins with a specific letter.
def print_char(arr)
  arr.each do |x|
    if x[:name].length < 12
      puts "My name is #{x[:name]} in the #{x[:cohort]} cohort and my name is less than 12 characters long!" 
    end
  end
end
# Rewrite the each() method that prints all students using while or until control flow methods
def print(arr)
  names = 0
  while names < arr.count
    puts "#{arr[names][:name]} in the #{arr[names][:cohort]} cohort, born in #{arr[names][:DOB]} and likes#{arr[names][:hobbies]}."
    names += 1  
  end
end

# finally, we print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(@width)
end
  
def start_input
  puts "Do you want to add a student? (y/n)".center(@width)
  answ = gets.chomp.upcase
  if answ == "Y"
    return true
  elsif answ == "N"
    return false
  else
    puts "try again".center(@width)
  end
  start_input
end

def input_students
  # create an empty array
  students = []
  
  initialise = start_input
  while initialise
    puts "Please enter the names of the students".center(@width)
    name = gets.chomp
    puts "Please enter the students DOB in dd/mm/yy.".center(@width)
    dob = gets.chomp 
    hobby = adding_hobbies
    students << {name: name, cohort: :november, DOB: dob, hobbies: hobby}
    puts "Now we have #{students.count} students".center(@width)
    initialise = start_input
  end
  # return the array of students
  students
end 

def adding_hobbies
  hobbies = " "
  puts "Please enter one of their hobbies".center(@width)
  hobby = gets.chomp
  puts "To finish, just hit return.".center(@width)
  while !hobby.empty?
    hobbies << hobby
    hobby = gets.chomp
  end
  hobbies
end

students = input_students
print_header
print(students)
print_footer(students)
# print_char(students)