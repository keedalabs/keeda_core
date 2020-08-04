class ChapterController < ApplicationController
  def index
    @topic = Topic.find_by(id: params[:id])
    @book = Activity.find_by(id: params[:book_id])
    @chapter = Activity.find_by(id: params[:chapter_id])
    @pages = @chapter.children
  end
end
