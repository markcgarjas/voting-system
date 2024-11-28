module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      user_scope = Devise.mappings.map(&:first).detect { |scope| cookies.signed["#{scope}.id"].present? }
      verified_user = User.find_by(id: cookies.signed["#{user_scope}.id"])
      if verified_user && cookies.signed["#{user_scope}.expires_at"] > Time.current
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
