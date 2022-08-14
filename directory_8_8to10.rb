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
# method for adding specific cohort

def adding_cohort 
  next_cohort = :september 
  puts " what cohort are they joining?".center(@width)
  puts " You have 3 option \n 1. September \n 2. January \n 3. April".center(@width)
  puts " Please select either 1 2 or 3.".center(@width)
  cohort = gets.chomp
  case cohort
  when "1"
    cohort = :september
  when "2"
    cohort = :january
  when "3"
    cohort = :april
  when ""
    puts "No input, the next cohort will be added".center(@width)
    cohort = next_cohort
  else 
    puts " input not recognised".center(@width)
  end
  cohort
end

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

def print_by_cohort(arr)
  puts "What cohort would you like to print?"
  cohort = gets.chomp
  arr.map { |s| s[:cohort] }.uniq.each do |c| puts "#{c} cohort students are..."
    list_names = arr.find_all { |s| s[:cohort] == c }.map { |s| s[:name] }.join(', ')
    puts list_names
  end
end


# finally, we print the total number of students
def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(@width)
  else 
    puts "Overall, we have #{names.count} great students".center(@width)
  end
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
    name = gets.strip
    puts "Please enter the students DOB in dd/mm/yy.".center(@width)
    dob = gets.strip 
    hobby = adding_hobbies
    cohort = adding_cohort
    students << {name: name, cohort: cohort, DOB: dob, hobbies: hobby}
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
print_by_cohort(students)
# print_char(students)