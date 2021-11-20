require 'rspec'
require './laba4/Task1.rb'

RSpec.describe "Laba4_1" do
  CONST_MONEY = 100
  subject{CashMachine.new(CONST_MONEY)}
  it 'balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("b","q")
    expect(subject.init)
    expect{subject.balance}.to output("Your balance: 5000\n").to_stdout
  end
  it 'deposit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d",1500,"q")
    expect(subject.init)
    expect{subject.balance}.to output("Your balance: 6500\n").to_stdout
  end
  it 'withdraw' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("w",2500,"q")
    expect(subject.init)
    expect{subject.balance}.to output("Your balance: 4000\n").to_stdout
  end
end
