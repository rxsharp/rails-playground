require 'test_helper'

class DevEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dev_entry = dev_entries(:one)
  end

  test "should get index" do
    get dev_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_dev_entry_url
    assert_response :success
  end

  test "should create dev_entry" do
    assert_difference('DevEntry.count') do
      post dev_entries_url, params: { dev_entry: { devDate: @dev_entry.devDate, devDuration: @dev_entry.devDuration, note: @dev_entry.note, project_id: @dev_entry.project_id, user_id: @dev_entry.user_id } }
    end

    assert_redirected_to dev_entry_url(DevEntry.last)
  end

  test "should show dev_entry" do
    get dev_entry_url(@dev_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_dev_entry_url(@dev_entry)
    assert_response :success
  end

  test "should update dev_entry" do
    patch dev_entry_url(@dev_entry), params: { dev_entry: { devDate: @dev_entry.devDate, devDuration: @dev_entry.devDuration, note: @dev_entry.note, project_id: @dev_entry.project_id, user_id: @dev_entry.user_id } }
    assert_redirected_to dev_entry_url(@dev_entry)
  end

  test "should destroy dev_entry" do
    assert_difference('DevEntry.count', -1) do
      delete dev_entry_url(@dev_entry)
    end

    assert_redirected_to dev_entries_url
  end
end
