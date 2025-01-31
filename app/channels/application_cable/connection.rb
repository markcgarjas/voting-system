# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      return reject_unauthorized_connection unless valid_user_session?

      user_scope = find_user_scope
      return reject_unauthorized_connection unless user_scope

      authenticate_user(user_scope)
    end

    def find_user_scope
      Devise.mappings.map(&:first).find { |scope| cookies.signed["#{scope}.id"].present? }
    end

    def valid_user_session?
      cookies.signed.present?
    end

    def authenticate_user(user_scope)
      user_id = cookies.signed["#{user_scope}.id"]
      expiration = cookies.signed["#{user_scope}.expires_at"]

      return reject_unauthorized_connection unless valid_expiration?(expiration)

      User.find_by(id: user_id) || reject_unauthorized_connection
    end

    def valid_expiration?(expiration)
      expiration.present? && expiration > Time.current
    end
  end
end
