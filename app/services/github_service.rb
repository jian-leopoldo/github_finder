class GithubService
  require 'json'

  attr_accessor :language


  def initialize(language)
    self.language = language
  end

  def self.repository_by_language(language)
    uri_local = "https://api.github.com/search/repositories?q=language:#{language}&sort=stars&order=desc"
    uri = URI(uri_local)
    res = Net::HTTP.get(uri)
    parsed_response = JSON.parse(res)
    puts  parsed_response['items'][0]
    parsed_response['items']
  end

end
