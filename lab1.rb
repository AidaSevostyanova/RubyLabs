def greeting
  puts "Введите свое имя: "
  firstname = gets.chomp()
  puts "Введите свою фамилию: "
  lastname = gets.chomp()
  puts "Введите свой возраст: "
  age = gets.to_i
  if age < 18
    puts "Привет, " + firstname + " " + lastname + ". Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else puts "Привет, " + firstname + " " + lastname + ". Самое время заняться делом!"
  end
end

def foobar(num1, num2)
  if num1 == 20 || num2 == 20
    return num2
  else puts "Сумма двух чисел: " + (num1+num2).to_s
  end
end

greeting
num2 = foobar(19,200)
