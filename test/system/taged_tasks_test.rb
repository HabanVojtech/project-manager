require "application_system_test_case"

class TagedTasksTest < ApplicationSystemTestCase
  setup do
    @taged_task = taged_tasks(:one)
  end

  test "visiting the index" do
    visit taged_tasks_url
    assert_selector "h1", text: "Taged Tasks"
  end

  test "creating a Taged task" do
    visit taged_tasks_url
    click_on "New Taged Task"

    fill_in "Tag", with: @taged_task.tag_id
    fill_in "Task", with: @taged_task.task_id
    click_on "Create Taged task"

    assert_text "Taged task was successfully created"
    click_on "Back"
  end

  test "updating a Taged task" do
    visit taged_tasks_url
    click_on "Edit", match: :first

    fill_in "Tag", with: @taged_task.tag_id
    fill_in "Task", with: @taged_task.task_id
    click_on "Update Taged task"

    assert_text "Taged task was successfully updated"
    click_on "Back"
  end

  test "destroying a Taged task" do
    visit taged_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taged task was successfully destroyed"
  end
end
