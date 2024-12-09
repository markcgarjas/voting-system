# frozen_string_literal: true

class NotificationChannel < ApplicationCable::Channel
  def subscribed
    return reject if current_user.is_a?(Symbol)

    if current_user.admin?
      stream_from 'admin_notifications'
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
