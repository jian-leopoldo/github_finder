require 'test_helper'

class RepositoriesFlowTest < ActionDispatch::IntegrationTest
  test "can see repositories page" do
    get "/repositories"
    assert_select "h1", "Repositórios:"
  end

  test "can see repositories tabs bar" do
    get "/repositories"
    assert_select "li", "RUBY"
  end


end
