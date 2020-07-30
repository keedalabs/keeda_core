class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    feed  = StreamRails.feed_manager.get_news_feeds(current_user.id)[:flat]
    results = feed.get()['results']
    enricher = StreamRails::Enrich.new
    @activities = enricher.enrich_activities(results)
    @following_topics = current_user.following_by_type('Topic')
  end
end
