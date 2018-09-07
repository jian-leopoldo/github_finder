class Repository < ApplicationRecord

  validates :language, presence: true
  validates :full_name, presence: true
  validates :html_url, presence: true
  validates :stargazers_count, presence: true


  def self.save_repositories(items, lang)
    5.times {|i| self.save_repository(items[i], lang) } 
  end

  def self.search_by_lang(language, refresh_repo=false)
    repos = Repository.where(language: language)
    self.get_new_repositories(language) if refresh_repo
    repos
  end

  def self.languages
    ['ruby', 'elixir', 'dart' ,'javascript', 'golang']
  end

  def self.get_new_repositories(language)
    items = GithubService.repository_by_language(language)
    self.save_repositories(items, language)
  end

  def self.save_repository(item, lang)
    repo = Repository.new(
      language:     lang,
      name:         item['name'],
      description:  item['description'],
      full_name:    item['full_name'],
      repo_url:     item['html_url'],
      repo_stars:   item['stargazers_count']
    )
    repo.save
  end



end
