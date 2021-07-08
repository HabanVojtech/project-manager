class AddNotNullsToProjects < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :position, :integer, null: false
    change_column :projects, :title, :string, null: false
  end
end
