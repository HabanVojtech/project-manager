json.extract! taged_task, :id, :task_id, :tag_id, :created_at, :updated_at
json.url taged_task_url(taged_task, format: :json)
