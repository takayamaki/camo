# frozen_string_literal: true

class ArrivalViewModel
  class << self
    def from_arrivals(arrivals)
      arrivals.map { |arrival| new(arrival) }
    end
  end

  attr_reader :arrival

  def initialize(arrival)
    @arrival = arrival
  end

  def to_hash
    {
      id: arrival.id,
      product_id: arrival.product_id,
      amount_in_cases: arrival.amount_in_cases,
      arrived_at: arrival.arrived_at.rfc3339,
      created_at: arrival.created_at.rfc3339,
      updated_at: arrival.updated_at.rfc3339,
    }
  end
end
