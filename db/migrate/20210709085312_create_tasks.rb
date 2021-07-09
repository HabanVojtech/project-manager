class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.attachment :file
      t.boolean :is_done, null: false
      t.integer :project_id
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
