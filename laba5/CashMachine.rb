class CashMachine

  def initialize
    @CONST_MONEY = 100
    @BALANCE_LIST_PATH = "laba5/Balance.bin"
    if File.exist?(@BALANCE_LIST_PATH)
      @money=File.read(@BALANCE_LIST_PATH).to_i
    else @money=@CONST_MONEY
    end
  end

  def deposit(amount)
    amount=amount.to_i
    if amount<100
      return -1
    elsif amount>=100 && amount<10000
      if amount%100==0
        @money=@money+amount
        write
        return 0
      else
        return -2
      end
    elsif amount>=10000
        return -3
    end
  end

  def withdraw(amount)
    amount=amount.to_i
    if amount<100
      return -1
    elsif amount>=100 && amount<10000
      if amount%100==0
        if amount<=@money
          @money=@money-amount
          write
          return 0
        else
          return -2
        end
      else
        return-3
      end
    elsif amount>=10000
        return -4
    end
  end

  def balance
    @money
  end

  def write
    File.write(@BALANCE_LIST_PATH, @money, mode: "w")
  end
end
