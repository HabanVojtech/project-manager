class AddNotNullToProjects < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :user_id, :integer, null: false
  end
end
