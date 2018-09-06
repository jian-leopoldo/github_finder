class RepositoriesController < ApplicationController

  def index
    @repositories = Repository.search_by_lang('ruby')
  end
end
