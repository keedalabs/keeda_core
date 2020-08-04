class ActivityChannel < ApplicationCable::Channel
  def subscribed
    puts params
    puts "activityId", params[:activity_id]
    stream_from "activity:#{params[:activity_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
