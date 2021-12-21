BALANCE_LIST_PATH = "laba3/Balance.txt"

CONST_MONEY = 100

def deposit(money)
  puts "ATM accepts the following bills:\n100\n500\n1000\n2000\n5000\nYou can deposit no more than 9900 at a time\nEnter your amount:"
  amount=gets.to_i
  if amount<100
    puts "You entered the amount less than the minimum, please try again"
  elsif amount>=100 && amount<10000
    if amount%100==0
      money=money+amount
      File.write(BALANCE_LIST_PATH, "#{money}\n", mode: "w")
      puts "Your balance: #{money}"
    else
      puts "You entered the wrong bill, please try again"
    end
  elsif amount>=10000
      puts "You entered the amount that exceeds the maximum deposit at a time, please try again"
  end
  money
end

def withdraw(money)
  puts "ATM dispenses the following bills:\n100\n500\n1000\n2000\n5000\nYou can withdraw no more than 9900 at a time\nEnter your amount:"
  amount=gets.to_i
  if amount<100
    puts "You entered the amount less than the minimum, please try again"
  elsif amount>=100 && amount<10000
    if amount%100==0
      if amount<=money
        money=money-amount
        File.write(BALANCE_LIST_PATH, "#{money}\n", mode: "w")
        puts "Your balance: #{money}"
      else
        puts "You entered the amount that exceeds your current balance, please try again"
      end
    else
      puts "You entered the wrong bill, please try again"
    end
  elsif amount>=10000
      puts "You entered the amount that exceeds the maximum withdraw at a time, please try again"
  end
  money
end

def balance(money)
  puts "Your balance: #{money}"
end

def quit(money)
  File.write(BALANCE_LIST_PATH, "#{money}\n", mode: "w")
end

def task3
  if File.exist?(BALANCE_LIST_PATH)
    money=File.read(BALANCE_LIST_PATH).to_i
  else money=CONST_MONEY.to_i
  end
  loop do
    puts "Deposit money (Press D)\nWithdraw money (Press W)\nCheck balance (Press B)\nQuit (Press Q)"
    letter=gets.chomp.downcase
    case letter
    when "d"
      money=deposit(money)
    when "w"
      money=withdraw(money)
    when "b"
      balance(money)
    when "q"
      quit(money)
      break
    else puts "No such command exists, please enter the correct letter"
    end
  end
end

#task3
