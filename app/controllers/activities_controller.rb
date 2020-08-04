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
  # GET /activities/1/edit
  def edit
    @activity  = Activity.find_by(id: params[:id])
  end
  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    @activity  = Activity.find_by(id: params[:id])
    new_activity_params = activity_params.clone
    if @activity.update(new_activity_params.except(:topics))
      @activity.destroy_activity_topics
      for topic in activity_params[:topics]&.split(',').to_a
        topic_model = Topic.where(name: topic).first_or_create!(name:topic)
        ActivityTopic.create!(topic: topic_model, activity: @activity)
      end

      cable_ready["activity:#{@activity.id}"].morph(
          selector: dom_id(@activity)+ "start",
          html: render_to_string(partial: "activities/activity", locals: {activity: @activity})
      )
      cable_ready.broadcast
      #format.html { redirect_to Activity.find_by(id: activity_params[:parent_activity_id]), notice: 'Activity was successfully created.' }
      head :ok

    else
      respond_to do |format|
        format.html
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity  = Activity.find_by(id: params[:id])
    @activity.destroy
    cable_ready["activity:#{@activity.id}"].remove(
        selector: dom_id(@activity)+ "start"
    )
    cable_ready.broadcast
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
      format.js {
        head :ok
      }
    end
  end

  def create
    new_activity_params = activity_params.clone
    puts new_activity_params
    @activity = Activity.new(new_activity_params.except(:topics))
    @activity.user_id = current_user.id
    if @activity.save!
      for topic in activity_params[:topics]&.split(',').to_a
        topic_model = Topic.where(name: topic).first_or_create!(name:topic)
        ActivityTopic.create!(topic: topic_model, activity: @activity)
        client = StreamRails.client
        topic_feed = client.feed('topic', topic_model.id)
        data = {actor: "User:#{current_user.id}", verb: 'activity', object: "Activity:#{@activity.id}", foreign_id: "Activity:#{@activity.id}"}
        topic_feed.add_activity(data)
      end
      if activity_params[:parent_activity_id].present?
        cable_ready["activity:#{@activity.parent_activity.id}"].insert_adjacent_html(
            selector: dom_id(@activity.parent_activity),
            position: "afterBegin",
            html: render_to_string(partial: "activities/activity", locals: {activity: @activity})
        )
        cable_ready.broadcast
        #format.html { redirect_to Activity.find_by(id: activity_params[:parent_activity_id]), notice: 'Activity was successfully created.' }
        head :ok
      else
        cable_ready["dashboard:#{current_user.id}"].insert_adjacent_html(
            selector: '#dashboard-list',
            position: "afterBegin",
            html: render_to_string(partial: "activities/activity", locals: {activity: @activity})
        )
        cable_ready.broadcast
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
      params.require(:activity).permit(:verb, :content, :user_id, :parent_activity_id, :topics, :object, :heading, :parent_id)
    end

end
