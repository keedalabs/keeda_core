class EventController < ApplicationController
  def index
    @topic = Topic.find_by(id: params[:id])
    @event = Activity.find_by(id: params[:event_id])
  end
end
