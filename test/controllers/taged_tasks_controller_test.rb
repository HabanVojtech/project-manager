require "test_helper"

class TagedTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taged_task = taged_tasks(:one)
  end

  test "should get index" do
    get taged_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_taged_task_url
    assert_response :success
  end

  test "should create taged_task" do
    assert_difference('TagedTask.count') do
      post taged_tasks_url, params: { taged_task: { tag_id: @taged_task.tag_id, task_id: @taged_task.task_id } }
    end

    assert_redirected_to taged_task_url(TagedTask.last)
  end

  test "should show taged_task" do
    get taged_task_url(@taged_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_taged_task_url(@taged_task)
    assert_response :success
  end

  test "should update taged_task" do
    patch taged_task_url(@taged_task), params: { taged_task: { tag_id: @taged_task.tag_id, task_id: @taged_task.task_id } }
    assert_redirected_to taged_task_url(@taged_task)
  end

  test "should destroy taged_task" do
    assert_difference('TagedTask.count', -1) do
      delete taged_task_url(@taged_task)
    end

    assert_redirected_to taged_tasks_url
  end
end
