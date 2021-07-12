require 'rails_helper'

RSpec.describe User, :type => :model do
    subject {
    described_class.new(email:"ahoj@seznam.cz",
                password:123456,
                password_confirmation:123456,
                first_name:"pepa",
                second_name:"aaa")
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a email" do
        subject.email = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
        subject.password = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a password_confirmation" do
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a first_name" do
        subject.first_name = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a second_name" do
        subject.second_name = nil
        expect(subject).to_not be_valid
    end

end

