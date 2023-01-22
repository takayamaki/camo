# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :restrict_with_error

  validates :ordered_at, presence: true
end
