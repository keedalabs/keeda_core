class TopicsController < InheritedResources::Base
  def show
    @topic = Topic.find_by(id: params[:id])
    if params[:type].present?
      @display_activities = @topic.activities.where(verb: params[:type])
    else
      @display_activities = @topic.activities
    end
    if params[:activity_id].present?
      @display_activity = Activity.find_by(id: params[:activity_id])
    end
    @new_activity = Activity.new
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
      params.require(:topic).permit(:name, :description, :type)
    end

end
