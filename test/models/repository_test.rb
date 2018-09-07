require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
 
  test "should not save repository without name" do
    repo = Repository.new(
      language:     'ruby',
      description:  'desc test',
      full_name:    'full_name',
      repo_url:     'repo_url',
      repo_stars:   1234
    )
    assert_not repo.save
  end

  test "should not save repository without full_name" do
    repo = Repository.new(
      name:         'name',
      language:     'ruby',
      description:  'desc test',
      repo_url:     'repo_url',
      repo_stars:   1234
    )
    assert_not repo.save
  end

  test "should not save repository without language" do
    repo = Repository.new(
      name:         'name',
      full_name:    'full_name',
      description:  'desc test',
      repo_url:     'repo_url',
      repo_stars:   1234
    )
    assert_not repo.save
  end

  test "should not save repository without repo_url" do
    repo = Repository.new(
      language:     'ruby',
      description:  'desc test',
      full_name:    'full_name',
      name:         'name',
      repo_stars:   1234
    )
    assert_not repo.save
  end

  test "should not save repository without repo_stars" do
    repo = Repository.new(
      language:     'ruby',
      description:  'desc test',
      full_name:    'full_name',
      name:         'name',
      repo_url:     'http://www.teste.com'
    )
    assert_not repo.save
  end

  test "should save repository " do
    repo = Repository.new(
      language:     'ruby',
      name:         'rails',
      description:  'desc test',
      full_name:    'full_name',
      repo_url:     'http://www.teste.com',
      repo_stars:   1234
    )
    repo.save
  end

  test "new repositories should return false if language is empty" do
    assert_not Repository.get_new_repositories('')
  end

  # test "repository should save new repositories from github API" do
  #   Repository.get_new_repositories('ruby')
  #   repos = Repository.where(language: 'ruby')
  #   assert repos.count > 1
  # end


end
