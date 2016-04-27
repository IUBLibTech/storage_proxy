require 'test_helper'

class CacheFilesControllerTest < ActionController::TestCase
  setup do
    @cache_file = cache_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cache_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cache_file" do
    assert_difference('CacheFile.count') do
      post :create, cache_file: {  }
    end

    assert_redirected_to cache_file_path(assigns(:cache_file))
  end

  test "should show cache_file" do
    get :show, id: @cache_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cache_file
    assert_response :success
  end

  test "should update cache_file" do
    patch :update, id: @cache_file, cache_file: {  }
    assert_redirected_to cache_file_path(assigns(:cache_file))
  end

  test "should destroy cache_file" do
    assert_difference('CacheFile.count', -1) do
      delete :destroy, id: @cache_file
    end

    assert_redirected_to cache_files_path
  end
end
