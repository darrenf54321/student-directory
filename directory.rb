@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean. Try again"
    end
  end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index} #{student[:name]} #{student[:hobby]} #{student[:age]} (#{student[:cohort]} cohort)"
  end
end

#Modify your program to only print the students whose name begins with a specific letter.
def print_letter(students)
  letter = "a"
  puts students.select {|person| person[:name][0] == letter}
end

#Modify your program to only print the students whose name is shorter than 12 characters.
def print_12(students)
  number = 12
  puts students.select {|person| person[:name].length < number}
end


def print_footer
  puts "Overall, we have #{@students.count} great students."
end

interactive_menu
