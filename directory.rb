@students = []
def input_students


  puts "To finish, just hit return twice"

  puts "Please enter the name of the student:"
  name = gets.chomp

  puts "and now please enter the student's favorite hobby:"
  hobby = gets.chomp
    while hobby.empty?
      puts "Please enter a hobby:"
      hobby = gets.chomp
    end

  puts "please enter the student's age:"
  age = gets.chomp
    while age.empty?
      puts "Please enter the student's age:"
      age = gets.chomp
    end

  puts "Which cohort is the student entering: "
  cohort = gets.chomp
    if cohort.empty?
      cohort = "November"
    else cohort = cohort
    end

  while !name.empty? do

  @students << {name: name, hobby: hobby, age: age, cohort: cohort}

    if @students.count > 1
      puts "now we have #{@students.count} students. Please enter another name:"
    else
      puts "now we have #{@students.count} student. Please enter another name:"
    end
    name = gets.chomp

      if name.empty?
        break
      else

        puts "......and the student's hobby:"
        hobby = gets.chomp
          while hobby.empty? do
            puts "Please enter a hobby:"
            hobby = gets.chomp
          end

        puts "please enter the student's age:"
        age = gets.chomp
          while age.empty? do
            puts "Please enter the student's age:"
            age = gets.chomp
          end

        puts "which cohort will the student be entering?"
        cohort = gets.chomp
          if cohort.empty?
            cohort = "November"
          else cohort = cohort
          end

        end
    end
  @students
end


def interactive_menu

  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection

    when "1"
      student = input_students
    when "2"
      print_header
      print(@students)
      print_footer(@students)
    when "9"
      exit
    else
      puts "I don't know what you mean. Try again"
    end
  end
end


def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
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


def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

interactive_menu
students = input_students
print_header
print(students)
#print_12(students)
#print_letter(students)
print_footer(students)
