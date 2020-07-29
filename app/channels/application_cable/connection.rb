module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    def connect
      puts "warden user", env["warden"].user
      self.current_user = env["warden"].user || reject_unauthorized_connection
    end
  end
end
