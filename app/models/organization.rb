class Organization < ApplicationRecord
  has_many :members

  validates :name, :code, presence: true, uniqueness: true
end
