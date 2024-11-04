class Organization < ApplicationRecord
  has_many :members, dependent: :destroy

  validates :name, :code, presence: true, uniqueness: true
end
