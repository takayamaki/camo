# frozen_string_literal: true

class Shipment < ApplicationRecord
  belongs_to :customer
  has_many :shipment_items, dependent: :restrict_with_error

  validates :shipped_at, presence: true
end
