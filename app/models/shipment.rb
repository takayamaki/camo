# frozen_string_literal: true

class Shipment < ApplicationRecord
  belongs_to :customer

  validates :shipped_at, presence: true
end
