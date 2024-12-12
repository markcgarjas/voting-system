# frozen_string_literal: true

class Candidate < ApplicationRecord
  belongs_to :officer_position
  belongs_to :party_list
  belongs_to :election

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :serial_number, presence: true, uniqueness: { scope: :election_id }
  validates :section, presence: true
  validates :course, presence: true
  validates :votes, numericality: { greater_than_or_equal_to: 0 }

  before_validation :generate_serial_number, on: :create
  before_save :format_name

  private

  def generate_serial_number
    return if serial_number.present?

    timestamp = Time.current.strftime('%y%m%d%H%M')
    next_id = (Candidate.maximum(:id) || 0) + 1
    self.serial_number = "#{timestamp}#{next_id.to_s.rjust(4, '0')}#{election_id.to_s.rjust(2, '0')}"
  end 

  def format_name
    self.name = name.titleize if name_changed?
  end
end
