require 'rspec'
require './laba4/Task2.rb'

RSpec.describe "Laba4_2" do
  context "Posts" do
    subject{PostsController.new}
    it 'index' do
      expect{subject.index}.to output("0. Hello World\n1. Hello (again)\n").to_stdout
    end
    it 'show' do
      allow_any_instance_of(PostsController).to receive(:gets).and_return(0)
      expect{subject.show}.to output("Enter post index: 0. Hello World\n").to_stdout
    end
    it 'create' do
      allow_any_instance_of(PostsController).to receive(:gets).and_return("Hello everyone")
      expect{subject.create}.to output("Enter post text: 2. Hello everyone\n").to_stdout
    end
    it 'update' do
      allow_any_instance_of(PostsController).to receive(:gets).and_return(1,"Hello")
      expect{subject.update}.to output("Enter post index: Enter post text: 1. Hello\n").to_stdout
    end
    it 'destroy' do
      allow_any_instance_of(PostsController).to receive(:gets).and_return(1)
      expect(subject.destroy)
      expect{subject.index}.to output("0. Hello World\n").to_stdout
    end
  end
  context "Comments" do
    subject{CommentsController.new}
    it 'index' do
      expect{subject.index}.to output("0. Beautiful\n1. Wonderful\n").to_stdout
    end
    it 'show' do
      allow_any_instance_of(CommentsController).to receive(:gets).and_return(0)
      expect{subject.show}.to output("Enter comment index: 0. Beautiful\n").to_stdout
    end
    it 'create' do
      allow_any_instance_of(CommentsController).to receive(:gets).and_return("Cool")
      expect{subject.create}.to output("Enter comment text: 2. Cool\n").to_stdout
    end
    it 'update' do
      allow_any_instance_of(CommentsController).to receive(:gets).and_return(1,"Wonderful")
      expect{subject.update}.to output("Enter comment index: Enter comment text: 1. Wonderful\n").to_stdout
    end
    it 'destroy' do
      allow_any_instance_of(CommentsController).to receive(:gets).and_return(1)
      expect(subject.destroy)
      expect{subject.index}.to output("0. Beautiful\n").to_stdout
    end
  end
end
