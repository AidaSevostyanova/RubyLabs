require 'rspec'
require './lab2.rb'

RSpec.describe "Main" do
  it "script1" do
    expect(script("bmw_cs")).to eq(64)
  end
  it "script2" do
    expect(script("bmw_csc")).to eq("csc_wmb")
  end
end
