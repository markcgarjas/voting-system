class Election < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end