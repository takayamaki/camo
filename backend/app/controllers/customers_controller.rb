# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    customers = Customer.all

    render json: CustomerViewModel.from_customers(customers)
  end

  def show
    customer = Customer.find(params[:id])

    render json: CustomerViewModel.from_customer(customer)
  end

  def create
    customer = Customer.create!(params.permit(:name))

    render json: CustomerViewModel.from_customer(customer)
  end

  def update
    customer = Customer.find(params[:id])
    customer.update!(params.permit(:name))

    render json: CustomerViewModel.from_customer(customer)
  end
end
