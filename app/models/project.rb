class Project < ApplicationRecord
    belongs_to  :user
    has_many :tasks, dependent: :destroy
    validates :position, presence: true
    validates :title, presence: true
end
