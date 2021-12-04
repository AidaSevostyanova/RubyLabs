require 'rspec'
require './laba2/lab2.rb'


RSpec.describe "Main" do
  it "script1" do
    expect(script("bmw_cs")).to eq(64)
  end
  it "script2" do
    expect(script("bmw_csc")).to eq("csc_wmb")
  end
  it "Pokemons" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2, "Pikachu", "Yellow", "Clody", "Pink")
    expect(pokemon).to eq([{"Pikachu"=>"Yellow"}, {"Clody"=>"Pink"}])
  end
end
