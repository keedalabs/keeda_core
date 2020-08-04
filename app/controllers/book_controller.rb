class BookController < ApplicationController
  def index
    @topic = Topic.find_by(id: params[:id])
    @book = Activity.find_by(id: params[:book_id])
    @chapters = @book.children
  end
end