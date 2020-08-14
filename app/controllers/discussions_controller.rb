class DiscussionsController < ApplicationController
  def index
    per_page = params[:per_page] || 5
    @per_page_count = per_page
    page = params[:page] || 1
    if params[:search]
      @activities = Activity.where(verb: 'discussion').algolia_search(params[:search]).page(page).per(per_page)
    else
      @activities = Activity.where(verb: 'discussion').page(page).per(per_page)
    end
    @search = params[:search]
  end
end
