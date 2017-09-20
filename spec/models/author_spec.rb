require 'rails_helper'

RSpec.describe Author do 
	subject {Author.new}

	it "its not valid without nombre" do
		expect(subject).not_to be_valid
	end

	it "its not valid with nombre longer than 100" do
		subject.nombre = 'a' * 101
		expect(subject).not_to be_valid
	end

	it "its valid with nombre equal to 100" do
		subject.nombre = 'a' * 100
		expect(subject).to be_valid
	end

	it "its valid with nombre less than 100" do
		subject.nombre = 'a' * 99
		expect(subject).to be_valid
	end
end