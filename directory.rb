
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "now we have #{students.count} students"
    name = gets.chomp

  end

  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_letter(students)
  letter = "a"
  puts students.select {|person| person[:name][0] == "a"}
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

students = input_students
print_header
#print(students)
print_footer(students)
print_letter(students)
