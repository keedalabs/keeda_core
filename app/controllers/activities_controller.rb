class ActivitiesController < InheritedResources::Base
  include CableReady::Broadcaster
  respond_to :html, :js, only: [:activity_replies]
  def new
    @activity  = Activity.new
  end

  def show
    @activity = Activity.find_by(id: params[:id])
    @new_activity = Activity.new
  end
  def activity_replies
    @activity = Activity.find_by(id: params[:id])
    puts @activity
    puts @activity.id
    puts dom_id(@activity)
    @replies = @activity.replies.page(params[:page]).per(params[:per_page])
    @per_page_count = params[:per_page]
  end
  def create
    new_activity_params = activity_params.clone
    puts new_activity_params
    @activity = Activity.new(new_activity_params.except(:topics))
    @activity.user_id = current_user.id
    if @activity.save
      for topic in activity_params[:topics]&.split(',').to_a
        topic_model = Topic.where(name: topic).first_or_create!(name:topic)
        ActivityTopic.create!(topic: topic_model, activity: @activity)
      end
      if activity_params[:parent_activity_id].present?
        cable_ready["activity"].insert_adjacent_html(
            selector: dom_id(@activity.parent_activity),
            position: "afterBegin",
            html: render_to_string(partial: "activities/activity", locals: {activity: @activity})
        )
        cable_ready.broadcast
        #format.html { redirect_to Activity.find_by(id: activity_params[:parent_activity_id]), notice: 'Activity was successfully created.' }
        head :ok
      else
        head :ok
      end
    else
      respond_to do |format|
      format.html { render :new }
      format.json { render json: @activity.errors, status: :unprocessable_entity }
    end
    end
    end
  private

    def activity_params
      params.require(:activity).permit(:verb, :content, :user_id, :parent_activity_id, :topics, :object)
    end

end
