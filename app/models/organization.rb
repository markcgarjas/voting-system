class Organization < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :elections, dependent: :destroy

  validates :name, :code, presence: true, uniqueness: true
end
