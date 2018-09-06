class GithubService
  require 'json'


  def init

  end

  def self.get_repository
    uri_local =  'https://api.github.com/search/repositories?q=language:ruby&sort=stars&order=desc'
    uri = URI(uri_local)
    res = Net::HTTP.get(uri)
    parsed_response = JSON.parse(res)
    puts  parsed_response
  end

end
