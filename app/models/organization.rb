class Organization < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :elections, dependent: :destroy
  has_many :party_lists

  validates :name, :code, presence: true, uniqueness: true

  scope :search_data, ->(query) {
    return all if query.blank?

    includes(members: %i[user officer_position])
      .references(:users, :officer_positions)
      .where(
        "users.username LIKE :query OR
       officer_positions.name LIKE :query OR
       organizations.name LIKE :query OR
       organizations.code LIKE :query",
        query: "%#{query}%"
      )
  }
end
