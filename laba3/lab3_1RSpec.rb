require 'rspec'
require './laba3/Task1.rb'

RSpec.describe "Main" do
  it "index" do
    expect{index}.to output("Twilight - fantastic\nAfter - melodrama\nMonster Corporation - cartoon\nShrek - cartoon\n").to_stdout
  end
  it "where" do
    expect(where("melodrama")).to eq(1)
 end
 it "update" do
   expect{index}.to output("Twilight - fantastic\nAfter - melodrama\nMonster Corporation - cartoon\nShrek - cartoon\n").to_stdout
 end
 it "find" do
   expect{find(3)}.to output("Shrek - cartoon\n").to_stdout
 end
 it "delete" do
   expect{index}.to output("Twilight - fantastic\nAfter - melodrama\nMonster Corporation - cartoon\nShrek - cartoon\n").to_stdout
 end
end
