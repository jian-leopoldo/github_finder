require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get success message" do
    get repositories_url
    assert_response :success
  end

  test "should get repositories from github" do
    get repositories_url
    assert Repository.all.count > 1
  end
  
end
