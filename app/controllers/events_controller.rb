class EventsController < ApplicationController
  def index
    per_page = params[:per_page] || 5
    @per_page_count = per_page
    page = params[:page] || 1
    if params[:search].present? || params[:address].present?
      params_algolia = {}
      params_algolia[:aroundLatLng] =  "#{params[:latitude]}, #{params[:longitude]}" if params[:address].present?
      @activities = Activity.where(verb: 'event').algolia_search(params[:search],params_algolia).page(page).per(per_page)
    else
      @activities = Activity.where(verb: 'event').page(page).per(per_page)
    end
    @search = params[:search]
  end
end
