# frozen_string_literal: true

class UserReflex < ApplicationReflex
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
    user = User.find_by(id: element.dataset['user-id'])
    if current_user.following?(user)
      current_user.stop_following(user)
    else
      current_user.follow(user)
      stream_client = StreamRails.client
      stream_client.feed('timeline', current_user.id).follow('user', user.id)
    end
    morph "#user_#{user.id}follow", ApplicationController.render(partial: "users/follow", locals: {user: user, current_user: current_user})
  end
end
