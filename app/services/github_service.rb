class GithubService
  require 'json'

  def self.repositories_by_language(language)
    return false if language.empty?
    uri_local = "https://api.github.com/search/repositories?q=language:#{language}&sort=stars&order=desc"
    uri = URI(uri_local)
    res = Net::HTTP.get(uri)
    parsed_response = JSON.parse(res)
    parsed_response['items']
  end

end
