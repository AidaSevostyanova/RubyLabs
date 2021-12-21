require 'rspec'
require './laba3/Task2.rb'

RSpec.describe "Main" do
  before do
    File.write(RESULTS_LIST_PATH,"")
  end
  it "task2_1" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(37,26,56,21,19,40,15,32,45,28)
    expect{task2}.to output("Введите возраст: \nВведите возраст: \nВведите возраст: \nВведите возраст: \nВведите возраст: \nВведите возраст: \nВведите возраст: \nВведите возраст: \nВведите возраст: \nВведите возраст: \nEkaterina Sotnic 37\nNina Petrova 26\nOleg Verchuk 56\nIrina Mir 21\nVictor Fizor 19\nPetr Nurluc 40\nBella Soft 15\nGabriela lik 32\nMaks Ribor 45\nEva Lawoi 28\n").to_stdout
  end
  it "task2_2" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(26,56,-1)
    expect{task2}.to output("Введите возраст: \nВведите возраст: \nВведите возраст: \nNina Petrova 26\nOleg Verchuk 56\n").to_stdout
  end
  it "task2_3" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(-1)
    expect{task2}.to output("Введите возраст: \n").to_stdout
  end
end
