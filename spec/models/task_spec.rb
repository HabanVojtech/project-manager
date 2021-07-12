require 'rails_helper'

RSpec.describe Task, :type => :model do
    let(:user) { User.create(email:"ahoj@seznam.cz",
                password:123456,
                password_confirmation:123456,
                first_name:"pepa",
                second_name:"aaa")
    }
    let(:project) { Project.create(title:"project",
                position:20,
                user_id:user.id)
    }
    subject {
    described_class.new(title: "Task",
                        description: "Description",
                        is_done: false,
                        user_id: user.id,
                        project_id: project.id)
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a project_id" do
        subject.project_id = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without a user_id" do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end
end
