# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :members

  enum role: { student: 0, admin: 1 }

  after_create_commit :broadcast_new_user_notification

  validates :email, :username, presence: true, uniqueness: true

  scope :search_data, lambda { |filter|
    return all if filter.blank?

    sanitized_filter = ActiveRecord::Base.sanitize_sql_like(filter)
    where('users.username LIKE ?', "%#{sanitized_filter}%")
      .or(where('users.email LIKE ?', "%#{sanitized_filter}%"))
  }

  def disappear
    update(session_token: nil)
  end

  private

  def view_student
    ActionController::Base.helpers.link_to(
      'View Details',
      Rails.application.routes.url_helpers.student_path(self),
      class: 'link-style'
    )
  end

  def broadcast_new_user_notification
    ActionCable.server.broadcast(
      'admin_notifications',
      {
        notice: "New user signed up: #{username}! #{view_student}".html_safe,
        alert: nil
      }
    )
  end
end
