# frozen_string_literal: true

class CustomerViewModel
  class << self
    def from_customers(customers)
      customers.map { |customer| new(customer) }
    end

    def from_customer(customer)
      new(customer)
    end
  end

  attr_reader :customer

  def initialize(customer)
    @customer = customer
  end

  def to_hash
    {
      id: customer.id,
      name: customer.name,
      created_at: customer.created_at.rfc3339,
      updated_at: customer.updated_at.rfc3339,
    }
  end
end
