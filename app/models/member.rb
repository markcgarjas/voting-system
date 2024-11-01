class Member < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  enum role: { member: 0, candidate: 1 }

  validates :user, presence: true, uniqueness: true
end
