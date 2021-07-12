class Project < ApplicationRecord
    scope :findtitle, ->(title) {where("title ilike ?","%#{title}%")}
    belongs_to  :user
    has_many :tasks, dependent: :destroy
    validates :position, presence: true
    validates :title, presence: true
    validates :user_id, presence: true
end
