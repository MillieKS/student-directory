require 'csv'

@students = []
@default_filename = "students.csv"

def open_file
  file = File.open($0, "r" )
    file.readlines.each do |row|
      puts row
    end
  file.close
end

open_file

def print_main_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def save_students
  puts "Please enter the name of the file"
  file_name = gets.chomp
  # open the file for writing with CSV
  CSV.open(file_name, "w") do |csv|
  # iterate over the array of students
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  file.close
  puts " File saved and closed"
end

def load_students(filename = @default_filename)
  puts "Please enter the name of the file"
  filename = gets.chomp
  CSV.foreach(filename, "r") do |row|
    row = name, cohort 
    adding_student(name, cohort)
  end
  puts "file #{filename} loaded"
end

def adding_student(name, cohort)
  @student << @students << {name: name, cohort: cohort.to_sym}
end


def loading_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    load_students
  elsif File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_main_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = STDIN.gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
    # add the student hash to the array
    adding_student(name, cohort)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
    end
    # return the array of students
    @students
  end
  
  def print_header
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
  end
  
  def print_student_list
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  
  def print_footer
    puts "Overall, we have #{@students.count} great students"
  end
  
  interactive_menu
  load_students
 