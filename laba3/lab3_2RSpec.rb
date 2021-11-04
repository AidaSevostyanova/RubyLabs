require 'rspec'
require './laba3/Task2.rb'

RSpec.describe "Main" do
  it "task2_1" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(26)
    expect{task2}.to output("Ekaterina Sotnic 37\n").to_stdout
  end
end
