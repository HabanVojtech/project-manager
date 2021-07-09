class Task < ApplicationRecord
    belongs_to  :user
    belongs_to  :project

    has_one_attached :file
end
