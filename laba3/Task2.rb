STAFF_LIST_PATH = "laba3/Staff.txt"
RESULTS_LIST_PATH = "laba3/results.txt"

def task2
  staff = []
  File.foreach(STAFF_LIST_PATH) { |employee| staff<<(employee.chomp) }
  loop do
    break if staff.size==0
    puts "Введите возраст: "
    age=gets.to_i
    break if age==-1
    for employee in staff
      File.write(RESULTS_LIST_PATH, "#{employee}\n", mode: "a") if employee.include?("#{age}")
      staff.delete(employee) if employee.include?("#{age}")
    end
  end
  File.foreach(RESULTS_LIST_PATH) { |employee| puts employee }
end

#task2
