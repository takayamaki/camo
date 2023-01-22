# frozen_string_literal: true

class InProcess < ApplicationRecord
  belongs_to :product
  has_many :shipment_items, dependent: :restrict_with_error

  validates :start_at, presence: true
  validates :amount_in_cases, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
