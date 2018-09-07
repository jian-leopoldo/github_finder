class RepositoriesController < ApplicationController

  def index
    return @repositories = Repository.search_by_lang(params[:lang], params[:refresh]) if params[:lang].present?
    @repositories = Repository.search_by_lang('ruby', params[:refresh]) if params[:lang].present?
  end


end
