# frozen_string_literal: true

class Arrival < ApplicationRecord
  belongs_to :product

  validates :arrived_at, presence: true
  validates :amount_in_cases, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
