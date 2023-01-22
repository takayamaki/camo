# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :amount_in_cases, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
