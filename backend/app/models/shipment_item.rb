# frozen_string_literal: true

class ShipmentItem < ApplicationRecord
  belongs_to :shipment
  belongs_to :in_process

  validates :amount_in_cases, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
