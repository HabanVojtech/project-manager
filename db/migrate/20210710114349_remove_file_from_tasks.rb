class RemoveFileFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :file_file_name, :string
    remove_column :tasks, :file_content_type, :string
    remove_column :tasks, :file_file_size, :bigint
    remove_column :tasks, :file_updated_at, :datetime
  end
end
