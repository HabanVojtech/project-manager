class Tag < ApplicationRecord
  belongs_to :user, foreign_key: :user_id  
  has_many :taged_tasks, dependent: :destroy
  has_many :tasks, through: :taged_tasks
end
