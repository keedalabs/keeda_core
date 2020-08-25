class TopicsController < InheritedResources::Base
  def show
    per_page = params[:per_page] || 5
    page = params[:page] || 1
    @topic = Topic.find_by(id: params[:id])
    if params[:type].present?
      @display_activities = @topic.activities.where(verb: params[:type]).page(page).per(per_page)
    else
      @display_activities = @topic.activities.page(page).per(per_page)
    end
    if params[:activity_id].present?
      @display_activity = Activity.find_by(id: params[:activity_id])
    end
    @new_activity = Activity.new
    @per_page_count = params[:per_page]
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_topic_activity
    @topic = Topic.find_by(id: params[:id])
    puts @topic.id
  end

  def wiki_list
    @topic = Topic.find_by(id: params[:id])
    @wikis = @topic.activities.where(verb: 'book')
    @new_activity = Activity.new(verb: 'book')
  end

  def event_list
    @topic = Topic.find_by(id: params[:id])
    @events = @topic.activities.where(verb: 'event')
    @new_activity = Activity.new(verb: 'event')
  end

  private

    def topic_params
      params.require(:topic).permit(:name, :description, :page, :per_page, :type, :avatar)
    end

end
