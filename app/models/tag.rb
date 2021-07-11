class Tag < ApplicationRecord
  scope :findtitle, ->(title) {where("title ilike ?","%#{title}%")}
  belongs_to :user, foreign_key: :user_id  
  has_many :taged_tasks, dependent: :destroy
  has_many :tasks, through: :taged_tasks
end
