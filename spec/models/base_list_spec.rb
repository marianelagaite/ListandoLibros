require 'rails_helper'

RSpec.describe BaseList do 
	subject {BaseList.new}

	it "its not valid without nombre" do
		expect(subject).not_to be_valid
	end

	it "its not valid with nombre longer than 50" do
		subject.nombre = 'a' * 51
		expect(subject).not_to be_valid
	end

	it "its valid with nombre equal to 50" do
		subject.nombre = 'a' * 50
		expect(subject).to be_valid
	end

	it "its valid with nombre less than 50" do
		subject.nombre = 'a' * 49
		expect(subject).to be_valid
	end
end