module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :session_id
    identified_by :current_user
    def connect
      self.session_id = cookies.encrypted[:session_id]
      user_id = cookies.encrypted[:user_id]
      if user_id.present?
        user = User.find_by(id: user_id)
        self.current_user = user
      end
    end
  end
end
