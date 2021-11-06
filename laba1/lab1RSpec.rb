require 'rspec'
require './lab1.rb'

RSpec.describe "Main" do
  it "greeting1" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Aida','Panina',10)
    expect(greeting).to eq("Привет, Aida Panina. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
  end
  it "greeting2" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Aida','Panina',30)
    expect(greeting).to eq("Привет, Aida Panina. Самое время заняться делом!")
  end

  it "foobar1" do
    expect(foobar(20,200)).to eq(200)
  end
  it "foobar2" do
    expect(foobar(120,200)).to eq("Сумма двух чисел: 320")
  end
end
