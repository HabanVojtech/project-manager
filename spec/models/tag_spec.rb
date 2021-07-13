require 'rails_helper'

RSpec.describe Tag, :type => :model do
    let(:user) { User.create(email:"ahoj@seznam.cz",
                password:123456,
                password_confirmation:123456,
                first_name:"pepa",
                second_name:"aaa")
    }
    subject {
    described_class.new(title: "Tag",
                        user_id: user.id)
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without a user_id" do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end
end
