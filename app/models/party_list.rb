# frozen_string_literal: true

class PartyList < ApplicationRecord
  belongs_to :organization

  validates :name, :description, presence: true, uniqueness: true
end
