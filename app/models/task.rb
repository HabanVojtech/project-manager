class Task < ApplicationRecord
    belongs_to  :user, foreign_key: :user_id 
    belongs_to  :project, foreign_key: :project_id 
    has_many :taged_tasks ,dependent: :destroy
    has_many :tags, through: :taged_tasks
    has_one_attached :file
end
