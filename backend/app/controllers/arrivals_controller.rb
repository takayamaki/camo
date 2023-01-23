# frozen_string_literal: true

class ArrivalsController < ApplicationController
  def index
    arrivals = Arrival.all

    render json: ArrivalViewModel.from_arrivals(arrivals)
  end

  def show
    arrival = Arrival.find(params[:id])

    render json: ArrivalViewModel.from_arrival(arrival)
  end

  def create
    arrival = Arrival.create!(params.permit(:product_id, :amount_in_cases, :arrived_at))

    render json: ArrivalViewModel.from_arrival(arrival)
  end

  def update
    arrival = Arrival.find(params[:id])
    arrival.update!(params.permit(:product_id, :amount_in_cases, :arrived_at))

    render json: ArrivalViewModel.from_arrival(arrival)
  end
end
