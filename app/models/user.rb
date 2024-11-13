class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :members

  enum role: { student: 0, admin: 1 }

  validates :email, :username, presence: true, uniqueness: true

  scope :search_data, lambda { |filter|
    return all if filter.blank?
    sanitized_filter = ActiveRecord::Base.sanitize_sql_like(filter)
    where('users.username LIKE ?', "%#{sanitized_filter}%")
      .or(where('users.email LIKE ?', "%#{sanitized_filter}%"))
  }
end
