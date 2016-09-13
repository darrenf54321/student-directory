
def input_students

  students = []

  puts "To finish, just hit return twice"

  puts "Please enter the name of the student:"

  name = gets.chomp

  puts "and now please enter the student's favorite hobby:"

  hobby = gets.chomp

  while !name.empty? || !hobby.empty? do
    students << {name: name, hobby: hobby, cohort: :november}
    puts "now we have #{students.count} students. Please enter another name and hobby:"
    name = gets.chomp
    hobby = gets.chomp

  end

  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index} #{student[:name]} #{student[:hobby]} (#{student[:cohort]} cohort)"
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

students = input_students
print_header
print(students)
#print_12(students)
print_letter(students)
print_footer(students)
