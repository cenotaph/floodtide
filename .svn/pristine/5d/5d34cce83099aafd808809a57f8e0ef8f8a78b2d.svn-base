class SearchController < ApplicationController

  def search
    @hits = Page.where('title LIKE "%' + params[:searchterm] + '%" OR subtitle LIKE "%' + params[:searchterm] + '%" OR body LIKE "%' + params[:searchterm] + '%"')
    @hits += Event.where('title LIKE "%' + params[:searchterm] + '%" OR description LIKE "%' + params[:searchterm] + '%"')
  end

end