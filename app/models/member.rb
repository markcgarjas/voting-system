# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  belongs_to :officer_position

  enum role: { member: 0, candidate: 1 }
end
