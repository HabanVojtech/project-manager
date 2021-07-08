class Project < ApplicationRecord
    belongs_to  :user

    validates :position, presence: true
    validates :title, presence: true
end
