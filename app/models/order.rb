# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer

  validates :ordered_at, presence: true
end
