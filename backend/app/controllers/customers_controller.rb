# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    customers = Customer.all

    render json: CustomerViewModel.from_customers(customers)
  end
end
