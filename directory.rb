@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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
      puts "I don't know what you mean. Try again"
    end
  end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "#{name} has been added to the database." #feedback to user 14.4
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
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

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

def save_students
  File.open("students.csv", "w") do |file| #Ch14.6 Using code block to open file
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  puts "The information has been saved to the database." #feedback to user 14.4
  end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file| #Ch14.6 Using code block to open file
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
        @students << {name: name, cohort: cohort.to_sym}
      end
  end
    puts "The data has been loaded." #feedback to user 14.4
end

  def try_load_students
    filename = ARGV.first
    if filename.nil?
      load_students("students.csv") #Ch14.2 students.csv loads by default
      puts "Loaded students.csv by default."
    elsif File.exist?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Silly Billy! #{filename} doesn't exist!"
      exit
    end
  end

try_load_students
interactive_menu
