class Repository < ApplicationRecord

  def self.save_repositories(items)
    5.times {|i| self.save_repository(items[i]) } 
  end

  def self.search_by_lang(language)
    repos = Repository.find_by(language: language)
    # self.get_new_repositories(language) unless repos.present?
    repos
  end

  def self.save_new_repositories(language)
    items = GithubService.repository_by_language(language)
    self.save_repositories(items, language)
  end

  def self.save_repository(item, lang)
    repo = Repository.new(
      language:   lang,
      name:       item['name'],
      full_name:  item['full_name'],
      repo_url:   item['html_url'],
      repo_stars: item['stargazers_count']
    )
    repo.save
  end



end
