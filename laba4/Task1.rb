class CashMachine

  def initialize(const)
    @BALANCE_LIST_PATH = "laba4/Balance.txt"
    if File.exist?(@BALANCE_LIST_PATH)
      @money=File.read(@BALANCE_LIST_PATH).to_i
    else @money=const
    end
  end

  def deposit
    puts "ATM accepts the following bills:\n100\n500\n1000\n2000\n5000\nYou can deposit no more than 9900 at a time\nEnter your amount:"
    amount=gets.to_i
    if amount<100
      puts "You entered the amount less than the minimum, please try again"
    elsif amount>=100 && amount<10000
      if amount%100==0
        @money=@money+amount
        File.write(@BALANCE_LIST_PATH, @money, mode: "w")
        puts "Your balance: #{@money}"
      else
        puts "You entered the wrong bill, please try again"
      end
    elsif amount>=10000
        puts "You entered the amount that exceeds the maximum deposit at a time, please try again"
    end
    @money
  end

  def withdraw
    puts "ATM dispenses the following bills:\n100\n500\n1000\n2000\n5000\nYou can withdraw no more than 9900 at a time\nEnter your amount:"
    amount=gets.to_i
    if amount<100
      puts "You entered the amount less than the minimum, please try again"
    elsif amount>=100 && amount<10000
      if amount%100==0
        if amount<=@money
          @money=@money-amount
          File.write(@BALANCE_LIST_PATH, @money, mode: "w")
          puts "Your balance: #{@money}"
        else
          puts "You entered the amount that exceeds your current balance, please try again"
        end
      else
        puts "You entered the wrong bill, please try again"
      end
    elsif amount>=10000
        puts "You entered the amount that exceeds the maximum withdraw at a time, please try again"
    end
    @money
  end

  def balance
    puts "Your balance: #{@money}"
  end

  def quit
    File.write(@BALANCE_LIST_PATH, @money, mode: "w")
  end

  def init
    loop do
      puts "Deposit money (Press D)\nWithdraw money (Press W)\nCheck balance (Press B)\nQuit (Press Q)"
      letter=gets.chomp.downcase
      case letter
      when "d"
        @money=deposit
      when "w"
        @money=withdraw
      when "b"
        balance
      when "q"
        quit
        break
      else puts "No such command exists, please enter the correct letter"
      end
    end
  end
end

CONST_MONEY = 100
cashMachine = CashMachine.new(CONST_MONEY)
cashMachine.init
