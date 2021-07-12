require 'rails_helper'

RSpec.describe TagedTask, :type => :model do
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
    let(:task) { Task.create(title: "Task",
                        description: "Description",
                        is_done: false,
                        user_id: user.id,
                        project_id: project.id)
    }
    let(:tag) {Tag.create(title: "Tag",
                        user_id: user.id)
    }
    subject {
    described_class.new(tag_id: tag.id,
                        task_id: task.id)
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a tag_id" do
        subject.tag_id = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a task_id" do
        subject.task_id = nil
        expect(subject).to_not be_valid
    end
    
end
