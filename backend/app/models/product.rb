# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :arrivals, dependent: :restrict_with_error
  has_many :order_items, dependent: :restrict_with_error

  validates :name, presence: true
end
