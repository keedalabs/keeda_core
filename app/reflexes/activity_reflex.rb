# frozen_string_literal: true

class ActivityReflex < ApplicationReflex
  delegate :current_user, to: :connection
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
  def like
    activity = Activity.find_by(id: element.dataset['activity-id'])
    reaction =  activity.reactions.find_or_initialize_by(verb: 'like', user_id: current_user.id)
    reaction.persisted? ? reaction.destroy : reaction.save
    morph "#activity_#{activity.id}likecount", activity.reactions.where(verb: 'like').count
  end
  def share
    activity = Activity.find_by(id: element.dataset['activity-id'])
    data = {actor: "User:#{current_user.id}", verb: 'reshared', object: "Activity:#{@activity.id}", foreign_id: "Activity:#{@activity.id}"}
    topic_feed.add_activity(data)
  end
end
